#! /bin/bash
#start.sh 
#this script is to start the build function.


echo "Do you need to start the work interface?(Y) or (N)"
read -p "input options > " options
case $options in
	[yY])
		source devel/setup.bash
		#echo 123 | sudo -S python run.py
		gnome-terminal -x bash -c "echo 'nvidia' | sudo tztek-jetson-tool-internal-trigger-camera /dev/ttyTHS0 30 1000"
		sleep 1s
		gnome-terminal -x bash -c "roslaunch src/launch/data_collect_system.launch;exec bash"
		sleep 1s
		echo "Do you need to record rosbag?(Y) or (N)"
		read -p " input options > " options
		case $options in
			[yY])
				sleep 1s 
				gnome-terminal -x bash -c "cd ~/Rosbag/script && ./record.sh;exec bash" 
				#gnome-terminal -e bash -c "cd ../Rosbag/script && rosbag record --split --size=2048 --buffsize=1024 $(cat ../Data_collection.txt);exec bash"
				
				;;
	

			[nN])
				echo "Exite!"
				;;
			*)
		esac #end case

		
		;;


	[nN])
		echo "Exite!"
		;;
	*)

 esac # end case









