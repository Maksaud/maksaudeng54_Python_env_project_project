# Python Environment Project

## Timings

3-5 Days

## Summary

We have a created a console JSON application that can gather data from IT Jobs Watch. Your job is to create working development, testing and production environment and to build a pipeline to move the code through them using Jenkins. This will include your application and configuration code. You can fork the repo for the application from the following link:

[https://github.com/spartaglobal/It_Jobs_Watch_Data_Package](https://github.com/spartaglobal/It_Jobs_Watch_Data_Package)

> Note: We will need to add the group to Repo on GitHub before it is accessible.

## Tasks

### Python App Pipeline
* Create a `development` environment using Vagrant and provision it with Chef such that it can run the application and tests successfully.
* Create an AMI using packer and chef that is capable of running the application and configure Jenkins to use this as a slave.
* Create a Jenkins job that listens for `PULL-REQUESTS` to your `dev` branch on your repo and starts a testing job.
* Tests should be run on the application on the slave node, if successfully code should be merged to the `master` branch.
* Create a job that builds your AMI when all tests have passed using **Packer**.

### Chef Python Cookbook Pipeline
* Create a `development` pipeline for your Python cookbook.
* Create a Jenkins job that listens for `PULL-REQUESTS` to your `dev` branch on your Python Cookbook repo and starts a testing job.
* Run tests using Chef Kitchen in the Cloud - `A test slave will be needed for this.`
* Create a job that will merge your changes to your configuration to the master branch which can then be used by the pipeline above.

### Trello

Trello is going to be your `Project Management` tool. The communication that you make through here is a vital activity that promotes effective traceability across the project. Something to think about is what would happen if someone is away from the office on holiday. `Would anyone be able to  pick up the work just by reading whats happening on Trello?` this is your aim.

#### Trello Deliverables

1. `DOR (Definition of Ready)` - Your `Sprint` cannot start until all your stories meet the definition of ready. This will be done during you `Planning` session. They include...
    1. Task has a well written `Description`
    2. Task has `Acceptance criteria`
    3. Task has a `Task Point` (Fibonacci)
    4. Task has a `Priority`
    5. Task has an `Assignee`
    6. Task has an `Epic` link

2. `DOD (Definition of Done)` - You need to define as a group a `definition of done` that you agree are the things that need to be done for each story before they are done...

  `For Example`:

    1. Meets the acceptance criteria?
    2. Has been reviewed by another member of the team?
    3. Has been reviewed by your trainer?
    4. It has been tested?
    5. Documentation has bee written?

3. `Progress Tracking` - Columns should be set out as following. If you trainer looks at this board they should be able to see the progress through this board by checking what is progress, what is in review etc? This will be regularly checked.

4. `Comments` - Comments should be written in the appropriate card to explain your progress and any blockers.

## GitHub

A major part of this project is your collaboration. You will be using GitHub as your source control. The following structure should be followed when designing your `Git Branching` strategy.


```bash
\__master branch (Protected)
 \__dev branch (Protected)                  Pull-requests(Trigger Jenkins)
  \__feature branches (One per stories)____/\
```

> TRAINER - Explanation of this structure can be found [HERE](https://github.com/spartaglobal/new-curriculum/tree/master/core/0-basics/advanced-git)


### Protected Branches
The `master` and `dev` should be protected on GitHub so nothing can be pushed to those branches. The collaboration should be done through `Pull-requests` that need to be reviewed by at least 2 people.

### Merging and Commits
Do this regularly, merge at least once a day to avoid the pain of bringing everything together at the end. `Commits` should be made regularly and should have specific messages like we have discussed before.

### Branches
The feature branches should be named as follows:

  `yourname-task-date` - e.g. `richard-loginfeature-250320`

### Scrum
We are going to be running this project using the `Scrum` framework. It is a priority that we follow the following events as it will make the project run more efficiently. You will be assessed on your ability to work as a team.

#### Requirements and Backlog
 `Session One`   
 The first task is to work out what the `Tasks` are going to be. These should be added to the `Backlog`. At this stage you will need to do a lot of investigation of how you are going to build the `Pipelines`, `AMIs` and `Tests` for the project. This is the time we need write our tasks and finish the first two tasks from the `DOR` to make sure it is ready for the sprint:

 1. Story has a well written `Task`
 2. Story has `Acceptance criteria`

#### Planning
`Session Two`
Once you have created your backlog. We need to start our planning session. This session can take anything between `1.5` and `2.0` hours. The areas that you want to cover here are the following:

3. Story has a `Story Point` (Fibonacci) - Planning Poker
4. Story has a `Priority` - Use the order of the stories in the board
5. Story has an `Assignee` - Trainer to assign stories
6. Story has an `Epic` link

> TRAINER - Work through each board with the group that has been created. Analyse everything that is in each task the trainees need to understand how to get these right. If there are issues get them to re-due. Emphasise they will be going through sessions like this on site.

Once this done your `DOR` has been met and you can start the sprint.

#### Stand-ups
Stand-ups should be documented and should follow the following structure:

* What you did yesterday?
* Any blockers?
* What are you doing today?

These should be quick and everyone should be prepared with these things ready to go.

#### The Sprint

This need to be timed and the deadline will be fixed. This should be started in Jira.

#### Delivery

The delivery session should be run as if the product is being demo'd to the stakeholders. A powerpoint presentation is not to be used. This should be a real situation where the team are presenting back to the business what has been achieved in the Sprint.

The trainees should follow this structure:-

1. What was the task?
2. What have you delivered?
3. DEMO - prepare to show off what has been done - `Preparation is key`
4. Q&A from the `Stakeholders`

This needs to be focused and to the point.

#### Retrospective
At the end of the Sprint the trainers should run the `Retrospective` that should be the time you can demonstrate what this session is used for. Go around the group only one person can speak at a time and they should cover firstly `Things to improve` as a team. Everyone gets their time to speak and everyone should respect this. `TRAINER` please make sure you manage this. Finally cover the `SUCCESSES`

## Deliverables

1. Python cookbook stored in a `github` repo ( this is separate from your app repo ) with Jenkins pipeline.
3. Forked ItJobsWatch application repo with Vagrantfile, Berksfile, packer.json and ability to simply Vagrant up and run in development.
4. Jenkins Job that runs test suite on pushes to `dev` branch of forked application repo and then merges to `master` if successful
5. Separate Jenkins job that builds an application AMI using packer.json when code is merged to `master` and tests pass successfully on app pipeline.

## Notes

When it comes to setting up the python slave nodes the group should create their amis. They students will not have access to the configuration of Jenkins to set one up. The instructor should create the new slave nodes when the students are ready with their `AMI's`

Editing in dev-branch again and again and again and again and again and again and again
