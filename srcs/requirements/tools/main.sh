FILE_PATH="/home/${USERNAME}/42_Inception/srcs/requirements/tools"

# chmod 777 $FILE_PATH/container_logs.sh
# chmod 777 $FILE_PATH/error_logs.sh
# chmod 777 $FILE_PATH/port_logs.sh

$FILE_PATH/container_logs.sh > container_logs.txt 2>> container_logs.txt
$FILE_PATH/error_logs.sh > error_logs.txt 2>> error_logs.txt
$FILE_PATH/port_logs.sh > ports_listening.txt 2>> error_logs.txt
