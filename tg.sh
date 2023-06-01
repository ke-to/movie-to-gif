# Convert video to gif file then open Quick Look
function tg () {
  local filename="$(ls | peco)"
  if [[ -n "$filename" ]]; then
    local output_filename="${filename%.*}.gif"
    ffmpeg -i "$filename" -filter_complex "[0:v] fps=10,scale=1000:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" "$output_filename"
    qlmanage -p "$output_filename" &> /dev/null
  else   
    echo "No file selected."
  fi
}
