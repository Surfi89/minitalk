<h1 align="center">
	💬 minitalk
</h1>

<p align="center">
	<b><i>The virtual machine</i></b><br>
</p>

<p align="center">
	<img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/surfi89/Born2beroot?color=lightblue" />
	<img alt="Number of lines of code" src="https://img.shields.io/tokei/lines/github/surfi89/Born2beroot?color=critical" />
	<img alt="Code language count" src="https://img.shields.io/github/languages/count/surfi89/Born2beroot?color=yellow" />
	<img alt="GitHub top language" src="https://img.shields.io/github/languages/top/surfi89/Born2beroot?color=blue" />
	<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/surfi89/Born2beroot?color=green" />
</p>

<h3 align="center">
	<a href="#%EF%B8%8F-about">About</a>
	<span> · </span>
	<a href="#%EF%B8%8F-usage">Usage</a>
	<span> · </span>
	<a href="#-testing">Testing</a>
</h3>

---

## 💡 About the project

> _The purpose of this project is to code a small data exchange program using
UNIX signals._


For more detailed information, look at the [**subject of this project**](https://github.com/Surfi89/42cursus/tree/main/Subject%20PDFs).


## 🛠️ Usage

### Requirements

The function is written in C language and thus needs the **`gcc` compiler** and some standard **C libraries** to run.

### Instructions

**1. Compiling**

To compile, go to the project path and run:

```shell
$ make
```


## 📋 Testing

To test the program you just need to launch the "server" and the "client" in different shell tabs with the following:

```shell
$ ./server
```

This will show your PID to make the client work and will stay waiting to receive a message from the "client"

```shell
$ ./client "PID" "Your message string"
```

By launching it, this will show "Your message string" on the server window.
