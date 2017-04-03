

# Slide with background image

[hyperlink-text](http://www.google.co.uk)

-   bulletpoint
-   dont go crazy


## Sub-slide - srolls vertically from slide above

Some source code using hightlits.js 

    (def clojure-devs "love brackets")


# Slide with code

    cherries <- sum(windows == "C")
    diamonds <- sum(windows == "DD")
    c(0, 2, 5)[cherries + 1] *
      c(1, 2, 4)[diamonds + 1]
    
    payoffs <- c("DD" = 800, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    same <- length(unique(windows)) == 1
    allbars <- all(windows %in% c("B", "BB", "BBB"))
    if (same) {
        prize <- payoffs[windows[1]]
    } else if (allbars) {
        prize <- 5
    } else {
        cherries <- sum(windows == "C")
        diamonds <- sum(windows == "DD")
        prize <- c(0, 2, 5)[cherries + 1] * c(1, 2, 4)[diamonds + 1]
    }


# Slide with Colour - overriding the theme

I love red.

Hightliht text as a fragment of the slide 


## Fragments in Reveal.js

Press the "Down" key on the page or the down arrow to trigger fragments

-   Create
-   Fragment
-   At Ease


## Fragment captions

    #+ATTR_REVEAL: :frag
       * Create
       * Fragment
       * At Ease


## Reveal.js Can Alert

Change slide style to wake up the sleepy audience.

