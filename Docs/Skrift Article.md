# Running Umbraco on a raspberry PI or How I stopped worrying and learned to love Linux

Why would you want to run Umbraco on a raspberry pi? Well, the short answer is, you wouldn't. It's not powerful enough to be useful in a production environment, it's "experimental"... well, still in Alpha. That's not the full story though, and the reason it's worthwhile doing is becuase of .NET Core, or as it will be known as going forward, .NET 5. 

We're about to go on a journey, you and I, which will install and setup .NET on a Pi and fire up the latest alpha of project UniCore. I'm assuming here that you a .NET Framework developer who wants to know a bit more about the cross platform capabilities of .NET Core, or .Net 5. However before we go too far forward, at this point we need a Wayne's world flashback on the history of .NET

## A little history of .NET Core

There's a lot of content written about this but the TL:DR version is that after Microsoft released .NET back in 2000 and for a long time, everything was good - as long as you used Windows.

Then in 2004 a very smart chap called [Miguel de Icaza](https://twitter.com/migueldeicaza) started the [Mono Project](https://www.mono-project.com/) with the intention of running the framework on Linux. Lots of work followed, a fantastic tool called Xamarin was released - a cross platform tool for smartphone app development. 

Fast forward a bit, Microsoft took note and in 2014 [announced asp.NET vNext during the community stantup](https://www.youtube.com/watch?v=1rLbT6pBtak) and they open sourced it all, eventually bought Xamarin and Github and released a [roadmap for .NET](https://github.com/dotnet/core/blob/master/roadmap.md) to unify the framework and .NET core into a single release. 

Finally in November 2020, [.NET 5 was released](https://devblogs.microsoft.com/dotnet/announcing-net-5-0/) to great acclaim and universal celebration all around. 

## Well that's great and all but so what?

This is a big deal, and there are plenty of examples online of compiling a [Self contained console app](https://docs.microsoft.com/en-us/dotnet/core/deploying/#self-contained-application) on windows, copying it onto a USB drive, popping it into a Mac and firing it up and boom! And this is where it becomes interesting to us as Umbraco developers, becuase that's the future - .NET Everywhere!!!

Windows server and IIS are never going to catch up to Linux in the application hosting world. Knowing this, but building the tools to allow .NET to run bascally anywhere, Microsoft neatly sidestepped the problem and gained access to a much bigger market. Make no mistake, in the future, your websites will be hosted and running on Linux.

## Introducing the Raspberry Pi

The Raspberry Pi, first created in 2012 is a single board Arm based computer that has been getting faster and more **functional**. You don't need anything like the most recent one, a Raspberry pi 2 or  greater will do. You need at least a Pi 2 becuase of certain instructions which aren't available in the Pi zero or first generation, but if you want to buy one I'd recommend a Pi 4. The latest [raspberry pi 400](https://thepihut.com/products/raspberry-pi-400) is a £70 computer that's built into a keyboard and is quite simply astonishing!

If you've never used linux, but want to try it's a fantastic way of getting up and running on a small cheap device, and it will open a gateway into a fantastic world of the Internet of Things. The instructions in this guide will also work on Linux, so if you don't have a raspberry pi, and want to try this, you could also do this on either an old computer or a virtual machine running linux. 

## Recommended setup

So - you've got your raspberry pi 2 or greater, what else will you need?

 - A MicroSD card, I would suggest minimum of 4gb, preferrably 8gb
 - Optionally, a fast USB drive. Micro SD cards are a lot slower than SSDs, and the RPi4 supports usb3 which makes things a lot faster when experimenting
 - A monitor which you can plug into the Raspberry Pi to get things setup. Once it's set-up you can run it purely on a network
 - Your usual peripherals - Keyboard, Mouse, endless supply of tea or coffee

You'll also need to :

 - Download [Raspberry Pi OS](https://www.raspberrypi.org/software/operating-systems/) - you'll need to choose the right version dependng on which Pi you have, but the Lite version is what I normally use.
 - An SD imaging tool - I use [Balena Etcher](https://www.balena.io/etcher/) as it's one of the most flexible ones but alternatively the [Raspberry Pi Imager](https://www.raspberrypi.org/software/) works too

Once you've got that all ready and a fresh hot drink on stand-by, it's time to start

1. Using Balena Etcher, or the Raspberry Pi Imager mount your chosen operating system onto the card using your main computer. Once copied, insert the card into the Pi, connect the display and power it up.
    - You'll need to go through the startup and set-up process and connect the Pi to the internet - this will be needed to complete later parts of this guide.
    - There's a more in-depth guide [here](https://www.raspberrypi.org/help/quick-start-guide.../)
2. *OPTIONALLY* - You can use the guide [here](https://www.raspberrypi.org/documentation/hardware/raspberrypi/bootmodes/msd.md) to boot your Pi from USB, which tends to be a fair amount faster than the MicroSD card, especially if you can mount it on a USB3 port
3. Install all the updates required, there will almost certainly be a bunch of updates to install. To do that open a terminal window ***Screenshot here of opening a terminal window*** and type in the following commands. Each will take between a few seconds to a few minutes depending on how many updates there are.
    - sudo apt-get -y update
    - sudo apt-get -t upgrade
4. Restart the pi once the updates are all completed with the following command
    - sudo reboot


Once that's all done we're ready to do the next step of getting .NET up and running, but before doing that it's an idea to explore around the raspbery operating system to get familiar with it.

## Getting .Net Core up and running

Once you're ready to set-up .NET on the Pi. Unfortunately there isn't an automated installation for .NET which runs on ARM - you need to do this manually - See [https://docs.microsoft.com/en-us/dotnet/core/install/linux-debian](https://docs.microsoft.com/en-us/dotnet/core/install/linux-debian). 

Fortunately, the excellent [Pete Gallagher](https://twitter.com/pete_codes) has taken on most of the hard work and created a script we can use. I've updated his original script with the latest updated version of the framework, but his original article is linked in the references.

Run the following command in a terminal window. 

    wget -O - https://raw.githubusercontent.com/CarlSargunar/dotnetcore3pi/feature/Update_Runtime_and_SDK/install.sh | sudo bash

Check for updates by running the following again in terminal

- sudo apt-get -y update
- sudo apt-get -t upgrade

And in theory ... that's it. Right? There's a simple test - run this in a terminal window

    dotnet --info



## References

 - [The .NET Core show Podcast](https://twitter.com/dotNetCoreShow) - A Brief History of .NET Core : [https://dotnetcore.show/episode-1-a-brief-history-of-net-core/](https://dotnetcore.show/episode-1-a-brief-history-of-net-core/) 
 - [Pete Gallagher](https://twitter.com/pete_codes) with the guide to running .NET 3 on a Pi [https://www.petecodes.co.uk/explorations-in-dot-net-core-3-0-for-raspberry-pi/](https://www.petecodes.co.uk/explorations-in-dot-net-core-3-0-for-raspberry-pi/)
