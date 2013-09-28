# sas-flow
An opinionated SAS workflow for better organization, collaboration, and multi-platform support.

## Preamble
`sas-flow` was created with a few goals in mind:

- **Organization:** We need a better way to organize SAS code than putting everything in one monolithic file, or a bunch of separate, unconnected files.
- **Collaboration:** It should be easy to share SAS code within a team of collaborators. Getting started with a `sas-flow` project you have never seen before should be easy and self-explanatory.
- **Reproducibility:** It should be easy to re-run an analysis and reliably get the same results (no "where did that number come from?").
- **Tooling:** SAS programmers should have state-of-the-art tools, like a real text editor (e.g. [Sublime Text][1]) for editing code and version control ([git][2]) for storing it.
- **Good defaults:** Sensible SAS defaults should be applied to every project, like setting the working directory appropriately and producing HTML output.
- **Mac support:** Mac users running SAS in a virtual machine should be first-class citizens and should be able to write code and view output in OS X.

To this end, `sas-flow` is a project template along with some well-documented guidelines. Together, these create a streamlined SAS workflow that will save time and prevent gray hairs.

### Learning curve

It will take you about an hour to carefully read through this documentation and understand how `sas-flow` works. __This time investment is 100% worth it.__ `sas-flow` will save you lots of time down the road.

Let's get started.

## Folder/file structure
The most important part of `sas-flow` is the folder/file structure. It provides organization to a project and plays a role in achieving all the goals of this project. This is the only non-optional part of `sas-flow`.

Here's the basic folder/file structure:

- `project_name`
  - `analysis`
  - `data`
  - `sas`
  - `sasout`
  - `README.txt`

I'll explain each of these folders/files in detail below.

#### The root folder (`project_name/`)
This is root folder for the project. It can be stored wherever you want on your computer and named whatever you want. I usually keep the name of this folder fairly short and use underscores instead of spaces, but it's up to you.

#### The analysis folder (`project_name/analysis/`)
I store everything that's not SAS code or SAS output here, including manuscript drafts, graphics, and slide decks. I create appropriate subfolders to organize these files.

#### The data folder (`project_name/data/`)
All data files go here.

_Reproducibility_ is a goal of `sas-flow`. A key part of this being able to reliably generate derived datasets from the original raw data. To this end, I always store the most raw data files possible in this folder.

If there are multiple versions of raw data files, I prefix their filenames with their creation date, e.g. `2013-09-26`, so they are sorted by this date.

Derived data files are also stored in this folder by SAS (SAS uses this folder as a library).

Any file in this folder that isn't created automatically by SAS or another program should be clearly explained in `project_name/readme.txt`.

#### The sas folder (`project_name/sas/`)
All the SAS code goes here.

`sas-flow` includes a few files by default in this folder:

- `project_name/sas/bootstrap.sas` sets up the paths used by SAS for the data library and output. You'll need to create this file from the included example file (explained in the __Getting started__ section below).
- `project_name/sas/preflight.sas` sets default SAS settings. You do not need to edit this file unless you don't like the `sas-flow` defaults.
- `project_name/sas/master.sas` is the file that you run in SAS every time you want to run your code. It _only_ contains references to other `.sas` code files.

__For a small project__, you should create two additional files in this folder that hold my actual SAS code:

1. `project_name/sas/cleaning.sas` to contain all data cleaning and data set generation code (pretty much all [`DATA` steps]).
2. `project_name/sas/analysis.sas` to contain all my analysis code (`PROC WHATEVER`s).

__For a more complex project__, you should additionally create a `project_name/sas/cleaning/` and/or a `project_name/sas/analysis/` folder and save your SAS code in multiple files in this folder. This makes it easier to run individual portions of the analysis. If you do this, each file should be independent (i.e. can be run in any order). If you do this, you can use the same technique used in `project_name/sas/master.sas` to reference the additional cleaning and analysis files. For example:

```
/* project_name/sas/master.sas */
%INCLUDE "bootstrap.sas";;
%INCLUDE "cleaning.sas";;
%INCLUDE "analysis.sas";;

/* project_name/sas/cleaning.sas */
%INCLUDE "cleaning/01_deidentify.sas";;
%INCLUDE "cleaning/02_rename_vars.sas";;

/* project_name/sas/cleaning.sas */
%INCLUDE "analysis/descriptive.sas";;
%INCLUDE "analysis/bivariate.sas";;
```

You should never modify study data in any file except `cleaning.sas` or files in `cleaning/`. This means you can run the cleaning code once, and then just run analysis code (or parts of it), which will be faster than running all your code each time you make a change.

#### The sas output folder (`project_name/sasout/`)
This folder is used by SAS to save the following:

1. The log output (instead of displaying it in SAS).
2. The contents of the output window.
3. A HTML version of the output. This is often easier to read than the plain text SAS output. It can be opened in any web browser.

You should never manually edit a file in this folder or save a file to this folder -- it is only for automated output.

#### The README file (`project_name/README.txt`)
This file should explain everything needed for a random SAS programmer to pick up and work on your project. Specifically, your README should include at a minimum:

- A brief description of the project and who is involved (including email addresses for everyone).
- An explanation of the source of every file in `project_name/data/` that isn't generated by SAS.
- The URL `http://epidemiology.github.io/sas-flow` and a prompt to read this documentation as a way to explain the folder structure, etc.

## Editing SAS code
There are massive time-saving benefits from using [Sublime Text] to edit SAS code rather than the built-in SAS editor. `sas-flow` is build specifically for use with Sublime Text, which is a cross-platform general purpose text editing application (i.e. Notepad on steroids).

The power of Sublime Text is best shown by example. Let's say you need to recode `'N/A'` to `' '` (missing) for a bunch of variables. Starting by copying the variable names from the first row of an Excel file, you can do the following in Sublime Text (playback is in real time):

> GIF here

Extrapolating from this simple example, it should be apparent how much time Sublime Text could save you. Specifically, Sublime Text offers the following advantages over the SAS editor:

- Multiline cursor (seen above).
- Tabs for opening multiple files at once and a sidebar for navigating a project folder.
- Advanced find and replace functionality with [regular expression] support.
- Automatic reloading of changed files.

A potential disadvantage of Sublime Text is that you cannot select and run a block of code as you can in the SAS editor. However, this is an [anti-pattern]: it requires repetitive text selection and mouse usage that is inefficient. `sas-flow` provides an alternative way to selectively run code through splitting up analysis SAS code into multiple files and running them individually.

(It is possible to open `sas-flow` analysis SAS code directly in SAS and select-and-run in the SAS editor is usually done. This is useful for experimentation but is discouraged for serious coding in favor of Sublime Text.)

New Sublime Text users should watch [this free screencast series], especially the following lessons:

- [Installation and base settings]
- [Multiple cursors and incremental search]
- [Split windows]
- [Folder and file creation]
- If you are already familiar with regular expressions, the [regular expressions] screencast may be helpful.

You will need [this Sublime Text syntax bundle] to properly display SAS files ([see instructions]). If you are using a Mac, you will also need to install `sasmono.ttf` (the SAS display font) on your Mac ([see instructions]).

## Getting started
Let's say you want to create a new project called `cancer` using `sas-flow`. Here's what to do:

1. [Download] the `sas-flow` template and unzip. Rename the unzipped folder `cancer` and move it to an appropriate place on your computer.
2. Open Sublime Text and go to Project > Add Folder To Project. Navigate to and select the `cancer` folder you just moved. You should have a window that looks like this:

  > subl1.png

3. Open `cancer/sas/bootstrap-example.sas` and modify the paths to reflect the absolute path to the `cancer` folder on your computer (e.g. `c:\work\projects\cancer\``). Save this file as `cancer/sas/bootstrap.sas`.

  If you are running SAS in a virtual machine, you'll need to share the `cancer` folder with your VM and use the path to the shared folder here. I would use `\\VBOXSRV\cancer\` on my VirtualBox VM.
4. Open `cancer/sas/bootstrap.sas` in SAS and run the entire file. (You have to do this once every time you re-launch SAS to load in the default paths.)
5. Open `cancer/sas/master.sas` in SAS. Running this file in SAS will run all the code in the project.
6. Open `cancer/sas/cleaning.sas` or `cancer/sas/analysis.sas` in Sublime Text. Write your code here, then hit _Run_ in SAS. The SAS log and output files will be saved in `cancer/sasout/` and can also be opened in Sublime Text.

  You can also open the `.html` file in `cancer/sasout/` in your web browser, which may be easier to read than the plaintext SAS output.

## Other resources

- [Using SAS on a Mac] - instructions for setting up SAS in a Windows virtual machine using [VirtalBox] on a Mac.

## What's next?

- `sas-flow` works great with [git], so the documentation should include some instructions for getting started with it.
- Add explanation of Stata support.
- A "Getting started" screencast would probably be helpful.

## Author

[Max Masnick], Department of Epidemiology and Public Health, University of Maryland, Baltimore. You can [contact me here].

## License ([MIT])

Copyright (c) 2013 Max Masnick

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.