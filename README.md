# Kingdom Hearts Steam Deck Launch

A simple script I wrote to make running the Kingdom Hearts HD 1.5+2.5 collection on the Steam Deck a bit more convenient. The game's default launcher crashes as soon as it tries to load a game due to Proton not being able to handle 

These are the steps to make this script work:
1. Install the Heroic Games Launcher flatpak. 
2. Download and install the Kingdom Hearts HD 1.5+2.5 collection.
3. Configure the game in Heroic Games Launcher to run with whatever Proton version works best for you. In my testing I have found Proton GE version 17 to be quite reliable. You can install it through protonup-qt.
4. Copy the `launcher.sh` script from this repository to the home folder of your Steam Deck.
5. Edit the first line of the script. Set this line to wherever you installed the game:

`INSTALL_DIR="/home/deck/Games/Heroic/KH_1.5_2.5/"`

6. Edit the second line of the script. Set this line to wherever you have Heroic Games Launcher installed. If you're using the flatpak you shouldn't need to change this:

`HEROIC_CONFIG_DIR="/home/deck/.var/app/com.heroicgameslauncher.hgl/config/heroic/GamesConfig/"`

7. Set the script's properties to be excutable.
8. Add the `launcher.sh` script to Steam to be able to launch from Gaming Mode.

You can now play all 4 games in the collection without needing to switch to Desktop Mode. The script will ask you to choose a game and then update Heroic's config to launch the correct executable. It then launches the game you selected through Heroic.
