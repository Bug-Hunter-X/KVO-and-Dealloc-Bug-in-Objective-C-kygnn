# Objective-C KVO and Memory Management Bug

This repository demonstrates a common but subtle bug in Objective-C related to Key-Value Observing (KVO) and memory management.  When an observed object is deallocated while observers are still registered, it can lead to crashes.

## The Bug

The `bug.m` file contains code that illustrates this issue. An observer is added to an object, but it's not removed before the object is released. This can result in a crash when the observed object is deallocated. 

## The Solution

The `bugSolution.m` file demonstrates the solution: always remove the observer using `removeObserver:forKeyPath:` before the observed object is deallocated (e.g., in the `dealloc` method).  Proper cleanup prevents crashes and ensures stable application behavior. 

## How to Reproduce

1. Clone this repository.
2. Open the project in Xcode.
3. Run the `bug.m` example.  You will likely see a crash.
4. Run the `bugSolution.m` example. This should run without crashing.

## Lessons Learned

* Always remove KVO observers in the `dealloc` method or when the observation is no longer needed to avoid crashes related to deallocation.
* Be mindful of memory management practices in conjunction with KVO to prevent unexpected behavior and ensure application stability.