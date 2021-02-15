---
title: "Segregation of Beliefs"
author: "Matias Andina"
date: 2017-12-01
tags: ["beliefs", "leadership", "information"]
---

## Start with Why

I am writing because I believe there is a powerful message in the ideas of Simon Sinek. I am also writing because I realized that we have already experienced mild and terrible consequences when certain people get this wrong. Simon Sinek is the author of interesting material such as *Start with why* and *Leaders eat Last*. I have had a great time reading his books and watching him talk. The call to surround ourselves by people who believe what we believe^[SinekVideo] had a powerful effect on the way I approach life. 

## Reinforcement

Finding people who believe what we believe is reinforcing, trust emerges, we belong, and we experience a sense of purpose unlike any other. You might feel well alone but the "lone wolf" is a less productive way (actually, wolves are gregarious, social animals). We can think about a positive feedback loop, an aggregation of like minded people that brings more like minded people to the group, generation after generation. Things cannot escalate to infinity (the world's population is limited), but they can get pretty big, pretty fast[^logistic].


<img src="/post/2017-12-01-segregation-of-beliefs/index_files/figure-html/logistic-1.png" width="672" />




Another way of reinforcement is by reducing [cognitive dissonance](https://en.wikipedia.org/wiki/Cognitive_dissonance). We experience an extreme load when dealing with opinions that are not aligned with what we think is true. Continuous accumulation of such a negative pressure ends up being unbearable. Thus, the relief we get from finding a group we belong to reinforces our behavior of moving towards/with them. 


## The Segregation Problem

### A simple desire

Let's be optimistic for a minute and assume that the vast majority of people have no problem living with people that are different, people who believe differently from what they believe. But let's add a simple desire, they want to live with a majority of people who do believe what they believe (say, 60% of my neighbors are like me). Well, the bad news is that the simple desire evolves into high degrees of segregation. Check the following simulation [here](http://ncase.me/polygons/).

![From random to segregated using 60% as threshold](/img/segregated.JPG)

### The Game of Life

The Game of Life is a creation by the mathematician John Horton Conway[^GameWiki]. Basic rules apply to set *life* free and watch it evolve:

1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
1. Any live cell with two or three live neighbours lives on to the next generation.
1. Any live cell with more than three live neighbours dies, as if by overpopulation.
1. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

Easy at it seems, this little cells can behave in spectacular ways. They can thrive and perish but they can also oscillate, establishing a pattern forever. Below I present 2 cases of many: 


Circle of Fire             |   Frog 2
:-------------------------:|:-------------------------:
![](http://www.conwaylife.com/w/images/5/50/Circleoffire.gif)  |  ![](http://www.conwaylife.com/w/images/a/ad/Frogii.gif)


These oscillators or *organisms* function as independent entities from day 1. But not all of them function like that. Some oscillators have a phase in which they grow or diversify. 

![Growing and Diversifying](/img/gol/gol_stage0to5.png)

Once self-assembled, they become stable and perpetuate. 

![Ready to oscillate forever](/img/gol/gol_stage6to7.png)

In the previous case, the critical mass was quite limited but oscillators need not to be small, check this monster called 258P3!  

![258P3](http://www.conwaylife.com/w/images/9/97/258p3.gif)



### Constant Beliefs

We might as well assume beliefs (B) are held constant or change little over long periods of time ($\frac{dB}{dt} \approx 0$). There are some reasons to believe this, we might consider:

1. The fact that one chooses to affiliate/adhere with a group based on a subset of **fixed** beliefs (e.g, Holy Trinity, Fundamental Theorem of Algebra, ...). Thus, one expects such beliefs, or at least the most fundamental ones, to be held constant for our lifetime or even longer than that.
1. The fact that information within such group is segregated and presented in a way that clearly distinguishes *us* from *them*. Tainted information becomes increasingly difficult to recognize when it's all the information there is. 
1. The fact that it requires an infinite amount of effort to think outside the margins of such reality, or diversify beliefs when stuck with a bunch of people that are riding the same boat, specially because all agreed on the first place that it was the correct boat to be in. 

### The republic, Lost

***
** continue here **

Seggregation allows two stories living in two different worlds that never talk to each other. Groups of people that only receive a partialized information and grow. Lawrence Lessig develops it further and more clearly[^RepublicLost].
***

### All in all

Segregation and self-suficient organizations might sound promising for companies. But how do we manage situations in which that logic gets taken into spheres of public policy or politics? What happens if the things that we believe, the things that segregate us, are disputes over facts or the veracity of evidence based reasons? What happens when we no longer agree on the definition of truth? Sticking our heads into our oasis of overlapping beliefs makes for a society unable to dialogue, willing to dangerously escalate into intolerance and violence. As in the Game of Life, autonomous organisms      





[^logistic]: We assume logistic growth to plot the curves on the figure $$ \frac{dN}{dt} = rN \left( 1 - \frac{N}{K} \right)$$`
[^GameWiki]: Game of Life [Wiki](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)
[^FindSimon]: You can find Simon everywhere ([Twitter](https://twitter.com/simonsinek)). My first encounter was [TED](https://www.ted.com/talks/simon_sinek_how_great_leaders_inspire_action).   
[^SinekVideo]: [Outstanding performance by Simon Sinek.](https://www.youtube.com/watch?v=llKvV8_T95M)
[^RepublicLost]: http://republic.lessig.org/
