# xframes-swift

## Instructions

### Installing Swift

#### Linux

On Ubuntu:

Follow these instructions carefully

https://www.swift.org/install/linux/tarball/

I recommend to install the SDK for static linking

https://www.swift.org/documentation/articles/static-linux-getting-started.html

### Building

It is crucial to enable the Extern experimental feature

`swift build -Xswiftc -enable-experimental-feature -Xswiftc Extern`

#### Linux

##### Dynamic linking

`swift build`

```
$ file ./.build/debug/xframes-swift
./.build/debug/xframes-swift: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, with debug_info, not stripped
```

The file size is > 30KB but it requires Swift to be installed on the target machine.

##### Static linking

`swift build --swift-sdk x86_64-swift-linux-musl`

```
$ file .build/x86_64-swift-linux-musl/debug/xframes-swift
.build/x86_64-swift-linux-musl/debug/xframes-swift: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, with debug_info, not stripped
```

The file size is > 40MB but it supposedly 'just works', no need to install any dependencies.

## Screenshots

Ubuntu 24.04

![image](https://github.com/user-attachments/assets/bd2af4ef-08a3-45b7-a84a-92c4c7c347f7)


### Running the app

#### Linux

`export LD_LIBRARY_PATH=/path/to/xframes/library:$LD_LIBRARY_PATH`
