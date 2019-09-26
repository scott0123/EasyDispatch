# EasyDispatch

Welcome to EasyDispatch, an objectiveC framework created to further simplify the global central dispatch operations and get around some annoying built-in timing constraints.

Feel free to ★STAR★ this project if it helps you.

## Background
There is a very specific niche problem caused by the default dispatch coalescing similar timed dispatch items. In some cases, this behavior is extremely undesirable, such as...
Many stackoverflow posts (eg) have been created to ask for a workaround, but the proposed solutions were all either ... or ...
This project serves as a free, open source alternative for 
It has elegant syntax and solves the problem.
I personally use it for many of my other macOS projects.

## Sample code
```
delay(0.5, ^{
    printf(“Hello World!”);
});
```

## Demo / Examples
Here are some examples that are given in the test cases of this XCode project:

* Example 1:
Two similar time interval dispatch threads changing color of some UI (or literally just console output the actual dispatch time)
(2.0s vs 2.1s)

* Example 2:
Lots of short, close together dispatch threads
(0.1, 0.2 ... 1.0)

* Example 3:
Two long dispatch threads
(10s vs 10.5s)


## Prerequisites
None

## How it works
Based on a one-shot 0 leeway timer with a handler.

Wrapper over dispatch\_source\_set\_event\_handler.

## Common errors
<details>
<summary><b>dyld: Library not loaded: ... Reason: image not found</b></summary>

<p>
XCode might complain that the image cannot be found. To fix this, there are two methods
	
* General > Embedded binaries > + (add) > Find EasyDispatch.framework
	
* Build phases > + (add) > New Copy Files Phase > Destination = frameworks > + (add) > Find EasyDispatch.framework

You can also change it into a static library and recompiling the framework file.
    
* Build setting > Linking > Mach-O Type = Static Library
</p>
</details>

## License
MIT License

## Contact
EasyDispatch@scott-liu.com
