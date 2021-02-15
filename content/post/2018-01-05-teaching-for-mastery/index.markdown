---
title: "Teaching for Mastery"
author: "Matias Andina"
date: 2018-01-05
output: html_document
tags: ["teaching", "learning", "ideas"]
---




# Grading on Progress

Grading on progress makes sense, equal effort equal remuneration. But the question we are trying to **quantify** with a grade is another one. We are trying to get a quantity in any scale that represents achievement. Particularly, we are interested in degree of achievement of the goals set at the beginning of the course by the professor.  

Great, so...How much do students learn? That is a difficult question, let's simplify by assuming some conditions:

1. We have set achievable learning objectives/goals.
1. We test often.
1. Our testing method is valid and graded fairly.
1. We obtain an accurate representation of whatever is on our students brains (aka "knowledge").
1. Students put roughly the same amount of effort.
1. Students put enough effort for the task.
1. Our teaching method is effective in increasing student's knowledge of the subject. 

If this were true, we would then likely see that our students make progress at roughly the same rate. But progress rate has its caveats. Let's choose two students. It happens that one of them came to the course with bit more knowledge on the subject matter than the other. Given the assumptions listed above, here's one possible outcome. 

<img src="/post/2018-01-05-teaching-for-mastery/index_files/figure-html/grading_progres-1.png" width="672" />


We can look at the performance summary in the following table. Both students performed similarly (`change` column) , but they didn't come with the same background (`min` column). Thus, the cumulative knowledge/score is higher for `studentA` (`max` column).


```
## `summarise()` ungrouping output (override with `.groups` argument)
```


-----------------------------------
 student     max     min    change 
---------- ------- ------- --------
 studentA   75.93   38.73    37.2  

 studentB   68.41   31.21    37.2  
-----------------------------------

## What to do

Grading on progress put us in a conflict. If measuring progress, both students should be graded equally. But a criterion-based method tells us otherwise. Whenever there's a critical amount of knowledge, it might be the case that some students fail to achieve it. Lowering the bar is not an option. Problems like this one do not arise because we chose the limit at 60%. Problems like this one arise because the arbitrary limit exists. There are options to solve the `Pass/Fail` issue. We can switch to setting a limit for the amount of progress students make in our classroom. However, setting an arbitrary limit for the amount of progress students make will still generate problems. Most importantly, in such a method, **passing students fail to achieve criteria**. 

Maybe our assumptions are wrong, maybe not all the students learn at the same rate. Let's take another case.   

<img src="/post/2018-01-05-teaching-for-mastery/index_files/figure-html/inter_progress-1.png" width="672" />


Let's take a look at the summary table.


```
## `summarise()` ungrouping output (override with `.groups` argument)
```


-----------------------------------
 student     max     min    change 
---------- ------- ------- --------
 studentB   68.41   31.21    37.2  

 studentC   67.55   67.51    0.04  
-----------------------------------

In this case, grading on progress produces a counter-intuitive result. Absurd example aside, we can argue that `studentC` is overqualified for the course. But the truth is, this student hasn't *mastered* the material yet. Wouldn't it be great if all students got to 100%?


# Mastery


> This is not a nice to have, it's a social imperative. - Salman Khan

Wouldn't we want our students to know *all* the material? Aiming for mastery implies that the bar is at 100%. It also means that advancement to the next level requires achieving all learning outcomes. Learning new material involves adding the new information to the network of already established concepts in our brain. We can think of it as adding a new floor to a building. We can't afford to let gaps in knowledge propagate year after year, just as we can't add floors to a skyscraper with terrible foundations. We can't afford gap propagation, even for small gaps. Salman Khan explains it better than me [here](https://www.ted.com/talks/sal_khan_let_s_teach_for_mastery_not_test_scores).


## The path

The path matters. We can think about learning in terms of packets of knowledge, cumulative unlocked skills or mini level-up moments. Let's take a look at the journey of `studentA` and `studentB`.

<img src="/post/2018-01-05-teaching-for-mastery/index_files/figure-html/path_plot_1-1.png" width="672" />


These students are *very similar*. In fact, we can see them struggling to get some concepts (check the colored region). Still, an arbitrary limit makes them look different. 

<img src="/post/2018-01-05-teaching-for-mastery/index_files/figure-html/path_plot_2-1.png" width="672" />

## The time constrain

Teaching for mastery requires that we flip over the constrains. Normally, we would constrain on time. Students have `x` weeks to get the cumulative percent that we considered *good enough*. That creates gaps in knowledge. Forcing students to advance to a new level will propagate those gaps. On the other hand, we could constrain knowledge. If students needed more time to acquire a particular skill or solve a particular type of problem, they should be allowed to. But all students should get to 100%. By teaching this way, we reinforce resilience and promote the correct mindset for problem solving.  

Using current technologies, it is possible to teach individualized lessons and track individual knowledge[^KhanAcademy]. If we use this strategy we need to deal with differences between a fast learner[^NotReally] and one that got stuck in a concept for longer. Here's how the paths would look like.

<img src="/post/2018-01-05-teaching-for-mastery/index_files/figure-html/fast_slow-1.png" width="672" />


We can see that one student mastered the content before the other. There's no problem with that. In fact, speed differences already happen in the current system and faster students disengage because there's no further development to go after. The big advantage of teaching for mastery is that we have options, at the moment marked with an asterisk `*` we could:

1) Promote the student to the next level. 
1) Promote the student to be `peer mentor`.
1) Both options at the same time.

The first option is the more individualistic. If one made progress at a faster pace, one should be allowed to move forward with more content. Here we have a first difference with the current system. Now, students are put together by age, as if that were the only variable that determined their capabilities. Teachers have to go a long way outside the comfort zone to give extra assignments to these students. When the content is already being delivered individually by design, there is no extra effort to pump more advanced material to fast learners.  

The second option allows the student to engage in fulfilling activities and enhance even more their confidence with the topic. To be able to mentor a student or teach a topic, you have to have mastered the content *and* be able to communicate it in a way the other mind can understand. Fostering empathetic relationships brings a social element to the classroom, priming students to a real-life experience in collaborative environment. Additionally, students that teach interact with the topic in different ways than traditional students. Peer mentors gain a complete new dimension by having to exercise visualization of different approaches to solve a problem or convey an argument.  

There are good arguments for having classrooms with small age differences. Sociability among students is heavily influenced by age and there are particular moments in development where two years of difference means a lot. Thus, exploring both options could be a good trade off for students. Given a student was able to master the material, now she has the opportunity to continue forward. But she also has the responsibility to help fellow students who are struggling. It sounds like a win-win situation to me. 


[^KhanAcademy]: Visit [Khan Academy](www.khanacademy.org)
[^NotReally]: When I say *fast* I do not mean to generalize, it's just for the sake of argument. Fast as in "a student that took less time to master that particular material".
