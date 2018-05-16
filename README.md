# 2018.5.12 Mining Installation Procedure (Linux, Ubuntu 16.0.4)

If you find this guide helpful, please feel free to send Ethereum donations to: 0x86124cA42b04A16Ca7bf8A8cAe1717EFA9B7C9bE

Or you can simply mine to that address for a day or two.  Thank you!

# NVIDIA Driver Location:

To install NVIDIA Drivers: 
https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal

The link at the bottom of the page above goes to Legacy Releases
https://developer.nvidia.com/cuda-toolkit-archive

For now, I recommended version 8.0 - I am running NVIDIA 1080 TIs and NVIDIA 1060s using this release. 
https://developer.nvidia.com/cuda-80-ga2-download-archive

# Setting up ethminer on linux ubuntu 16.0.4

Follow the steps from this blog: - start on step 2. (SKIP NVIDIA DRIVER PART - you did that already in the link above)
https://www.perfacilis.com/blog/crypto-currency/mining-ethereum-on-ubuntu-with-ethminer.html

After installing the drivers - you need to restart your computer - you should notice a change in screen resolution. 

When ethminer -U -M fails the first time, do not stress! Run it 2-3 times - it tends to fail the first time.



You are now ready to mine Ethereum!

# Picking a mining pool.

There are three possible mining pools that I recommend. These are all great options, personally I prefer Dwarfpool.  I like their web interface and I think they do a good job keeping the quantity of ethereum I have successfully mined updated quickly.  I originally started off with ethereumpool.co and although they always successfully paid me out, their web interface was extremely slow to load / update and quite buggy. 

1. Dwarfpool (The pool I am using now)  https://dwarfpool.com/eth
2. Nanopool https://eth.nanopool.org/?_ga=2.204087184.1437060743.1526426779-1017744524.1514639039
3. ethereumpol.co  (The first pool I used) https://ethereumpool.co/

The line of code below runs a test on your machine to see if everything is setup properly. 

./ethminer/ethminer -U -M 

The code below begins mining on the ethereumpool.co mining pool. 

cd ethminer
cd build
./ethminer/ethminer -U -F http://ethereumpool.co/?miner="YOUR-HASH-RATE"@"YOUR-ETHEREUM-ADDRESS"@"YOUR-MACHINE-NAME"

Below is a line of code that is an example from one of my rigs. 

./ethminer/ethminer -U -F http://ethereumpool.co/?miner=150@0x86124cA42b04A16Ca7bf8A8cAe1717EFA9B7C9bE@CryptoHarvester1


Good luck & happy mining!

# Overclocking (Advanced) Linux Ubuntu 16.0.4 + NVIDIA

Great! So now you area all setup and mining ethereum.  You are now wondering, is it possible for me to mine even more Ethereum while using less energy?  Yes!  To do that, you should follow these steps.

# Setting up Coolbits:

sudo nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration

Verify the file has been edited: (look for coolbits & all your graphics cards & no comment (#) in front of Option  Coolbits)

	sudo nano /etc/X11/xorg.conf

Edit overclocking script
	nano overclock.sh

An example overclocking script from my desktop, where I have one 1080 TI and one 1060 is attached as a bash file for reference.

# NVIDIA 1080 TI Overclock Settings

To find the 'optimal' memory offset, i slowly stepped up the memory clock in steps of 50 MHz until I reached a maximum amount.  I found that at 700MHz my hash rate started to decrease.  Your card may be different (especially if it is a different manufacturer than ASUS and may have a different 'optimal' memory offset.

memoryOffset: +650 MHz, I was able to obtain ~34.56 MH/s using ethminer. 

I set a power limit of 213 for my 1080 TI - I didn't reduce the power so low that the card/computer shut down.  I just reduced it to about 70% of the maximum power draw. 

# NVIDIA 1060 Overclock Settings

memory offset: + 800 MHz, I was able to obtain 18.56 MH/s using ethminer. 

power limit: 150.  This could likely be set lower for even more power consumption. 
