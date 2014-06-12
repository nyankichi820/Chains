Chains
======

Chains is edit actions on InterfaceBuilder  library


- edit chain action on InterfaceBuilder.
- nested actions.
- do sync and async actions .

## Install

    pod 'Chains'
   

## Usage

### Basic

- add CANAnimation class in viewController view

![img1](https://qiita-image-store.s3.amazonaws.com/0/37731/e7d2201f-b3ed-0329-a6e2-bdd3481edbf3.png)

- connection to target property the View you want to animate 

![img2](https://qiita-image-store.s3.amazonaws.com/0/37731/50f015e5-0d07-e788-27f2-ebeca3f99c70.png)

- We will continue to nest the class if you want to connect the animation

![img3](https://qiita-image-store.s3.amazonaws.com/0/37731/ad664270-8fe3-582c-b53b-9821b6a3ffed.png)


execute animation when did view appear 

- please set delegate and completion property  if want to execute  end process 

- connection startChain method if start at ui event 
![img4](https://qiita-image-store.s3.amazonaws.com/0/37731/90bbef5d-1e5e-6f85-ef8d-628f01445667.png)


more see also [Qiita](http://qiita.com/appwatcher/items/79f224532872dbec60d8)
