---
slug: Post
title: Post
date: 2014-07-13
template: post.hbt
lang: en
translated: false
cover:
  file: /images/styleguides/post-header.jpg
  desc: The is a description for the post's cover image.
  ini_pos:
  end_pos: bottom
---

This is a paragraph. Lorem ipsum dolor sit amet, consectetur adipisicing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
minim veniam, quis.

## This is a h2 header

This is a paragraph following the header. Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do.

### This is a h3 header

This is a paragraph following the header. Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do.

#### This is a h4 header

This is a paragraph following the header. Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do.

## Inline elements

### Bold text

This is a paragraph with __some bolded text__. Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod.

### Italic text

This is a paragraph with _some italic text_. Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod.

### Striked text

This is a paragraph with ~~some striked text~~. Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod.

### Links

This is a paragraph with [a normal link](#). Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod.

This is a paragraph with [__a bold link__](#). Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod.

This is a paragraph with [_a italic link_](#). Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod.

### Abbreviations

This is a paragraph with <abbr title="HyperText Markup Language">HTML</abbr>
abbreviation. Put the cursor over it to see its meaning.

### Quotes

This is a paragraph with <q>a quoted text here</q>. Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod.

## Blockquotes

> This is a paragraph inside a blockquoted section. Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod tempor.

### With citation

> Air and light and time and space have nothing to do with it and don’t create
anything except maybe a longer life to find new excuses for.
<footer>
  <cite>Charles Bukowski</cite>
</footer>

### With citation link

> The canvas element provides scripts with a resolution-dependent bitmap
canvas, which can be used for rendering graphs, game graphics, art, or other
visual images on the fly.
<footer>
  <cite>
    [The canvas element][canvas] at Scripting — HTML5
  </cite>
</footer>

[canvas]: http://www.w3.org/TR/html5/scripting-1.html#the-canvas-element

### Pulled to right

<blockquote class="blockquote--pull-right">
  <p>
    The canvas element provides scripts with a resolution-dependent bitmap
    canvas, which can be used for rendering graphs, game graphics, art, or other
    visual images on the fly.
  </p>
  <footer>
    <cite>
      [The canvas element][canvas] at Scripting — HTML5
    </cite>
  </footer>
</blockquote>

### Floating to right

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

<blockquote class="blockquote--float-right">
  <p>
    This is a blockquoted section floating to the right side of the text. Lorem
    ipsum dolor sit amet.
  </p>
</blockquote>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat.

### Floating and pulled to right

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

<blockquote class="blockquote--pull-right blockquote--float-right">
  <p>
    This is a blockquoted section floating to the right side of the text. Lorem
    ipsum dolor sit amet.
  </p>
</blockquote>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat.

### Floating to left

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

<blockquote class="blockquote--float-left">
  <p>
    This is a blockquoted section floating to the right side of the text. Lorem
    ipsum dolor sit amet.
  </p>
</blockquote>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat.

### Floating to left and pulled to right

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

<blockquote class="blockquote--pull-right blockquote--float-left">
  <p>
    This is a blockquoted section floating to the right side of the text. Lorem
    ipsum dolor sit amet.
  </p>
</blockquote>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat.


## Lists

### Ordered list

1. Lorem ipsum dolor
2. The flavor of bacon
  1. Lorem ipsum dolor
  2. The flavor of bacon
3. One day I'll end this
  - Lorem ipsum dolor
  - The flavor of bacon

### Unordered list

- Lorem ipsum dolor
- The flavor of bacon
  - The flavor of bacon
  - One day I'll end this
- One day I'll end this
  1. Lorem ipsum dolor
  2. The flavor of bacon


## Images

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

<figure class="alm-post-figure">
  <img class="alm-post-image"
       src="/images/styleguides/post-image.jpg"
       alt="A normal post image." />
</figure>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Highlighted

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

<figure class="alm-post-figure alm-post-figure--is-highlighted">
  <img class="alm-post-image"
       src="/images/styleguides/post-image.jpg"
       alt="A highlighted post image." />
</figure>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### With caption

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

<figure class="alm-post-figure">
  <img class="alm-post-image"
       src="/images/styleguides/post-image.jpg"
       alt="A post image with caption." />
  <figcaption class="alm-post-figure-caption">A caption text here.</figcaption>
</figure>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Highlighted with caption

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

<figure class="alm-post-figure alm-post-figure--is-highlighted">
  <img class="alm-post-image"
       src="/images/styleguides/post-image.jpg"
       alt="A post image with caption." />
  <figcaption class="alm-post-figure-caption">A caption text here.</figcaption>
</figure>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### With floats

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
<img class="alm-post-image alm-post-image--float-left"
     src="/images/styleguides/post-image-float.jpg"
     alt="A post image floated to the left." />
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
<img class="alm-post-image alm-post-image--float-right"
     src="/images/styleguides/post-image-float.jpg"
     alt="A post image floated to the right." />
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.

### With floats and captions

<figure class="alm-post-figure alm-post-image--float-left">
  <img class="alm-post-image"
       src="/images/styleguides/post-image-float.jpg"
       alt="A post image with caption floated to the left." />
  <figcaption class="alm-post-figure-caption">A caption text here.</figcaption>
</figure>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Rounded

<figure class="alm-post-figure alm-post-image--float-right">
  <img class="alm-post-image alm-post-image--is-rounded"
       src="/images/styleguides/post-image-float.jpg"
       alt="A rounded post image with caption floated to the right." />
  <figcaption class="alm-post-figure-caption">A caption text here.</figcaption>
</figure>

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
<img class="alm-post-image alm-post-image--float-left alm-post-image--is-rounded"
     src="/images/styleguides/post-image-float.jpg"
     alt="A rounded post image floated to the left." />
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

## Context separator

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

---

Consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur.
