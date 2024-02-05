
function get_docker_files(){
    files=$(find . -type f -name "docker-compose*.yml")
    echo $files
}