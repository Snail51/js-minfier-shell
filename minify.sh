#!/bin/bash
# minifies all .js files downwind from the specified path if they are located in a /[cC]ode/src/ and writes them to /[cCode]/exe/

root=$1

files=$(find $root -path "*/[cC]ode/src/*.js")

now=$(date)

for file in $files; do
    sleep 3; # wait three seconds as to not overwhelm the API-- will return `error code: 1015` if rate limit is exceeded

    # gather relevant info
    source_path=$(realpath "$file")
    source_file=$(basename "$source_path")
    source_dir=$(dirname "$source_path")
    output_dir=$(realpath "${source_dir}/../exe")
    output_file="${output_dir}/${source_file}";

    # do the curl POST to the API endpoint
    source_content=$(cat "$source_path");
    header=$(echo -e "// MINIFIED VERSION OF THE FILE OF THE SAME NAME IN THE \`src\` FOLDER\n// MINIFIED WITH https://www.toptal.com/developers/javascript-minifier\n// MINIFIED AT ${now}")
    response=$(curl -X POST -s --data-urlencode "input=$source_content" https://www.toptal.com/developers/javascript-minifier/api/raw)

    # write result
    mkdir "$output_dir" 2>/dev/null # make the output `exe` dir if it doesn't already exist
    touch "$output_file" # touch the output file to make sure it exists
    printf '%s\n\n%s' "$header" "$response" > "$output_file" # redirect the data to the output file


    # print to console
    echo "Minified \`${source_path}\` ---> \`${output_file}\`"
done

echo "Minification Complete"
echo -en "\a" # ring the command line bell