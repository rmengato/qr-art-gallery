# QR Code art gallery

## Introduction

This repo aims to create an OLAP Database with data on art pieces from the Metropolitan Museum of Art, but also include QR codes for a link with further details on each art piece. With this, it will be possible to use the dashboard in classrooms for art or history of art studies, but also allow students to access the art piece's link easily and in a fast manner, in order to see each piece up close, with high definition details, if they wish to.  

### DataTalks.Club Zoomcamp
This is my iteration of the final project propposed by the organizers of the Data Engineering Zoomcamp.
For those who eventually stumble upon this repository and are not aware, the Data Talks Club Engineering Zoomcamp is a nine week free bootcamp. More info on Data Talks Club on their [website](https://datatalks.club/). They have top notch teachers and courses, on different areas of data. I highly recommend checking their work and have learned a lot troughout the course.

## The Project

Description of the project in more technical terms.

### Guidelines and goals

The project guidelines are described on the course's [github](https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/projects). They delineate minimum requirements, but allow the participant to choose their preferred tools and programming languages. 

### Pipeline Type

For this project, **batch** pipelines will be created.

### Chosen tools for the project

Cloud Storage: **Google Cloud**

Data Warehouse: **Google BigQuery**

Infrastructure as Code (IaC): **Terraform**

Workflow Orchestration: **Kestra**

Transformations: **Python Pandas library**

**Ingestion**: dlt


![data_museum drawio](https://github.com/user-attachments/assets/1126d6d6-b96b-4326-ba56-a2a02e85f8a4)


### Chosen Datasets

The chosen Dataset will be obtained from the [Metropolitan Museum of Art API](https://metmuseum.github.io/).


    Problem description
        4 points: Problem is well described and it's clear what the problem the project solves
    Cloud
        4 points: The project is developed in the cloud and IaC tools are used
    Data ingestion (choose either batch or stream)
        Batch / Workflow orchestration
            4 points: End-to-end pipeline: multiple steps in the DAG, uploading data to data lake
    Data warehouse
        4 points: Tables are partitioned and clustered in a way that makes sense for the upstream queries (with explanation)
    Transformations (dbt, spark, etc)
        4 points: Tranformations are defined with dbt, Spark or similar technologies
    Dashboard
        4 points: A dashboard with 2 tiles
    Reproducibility
        4 points: Instructions are clear, it's easy to run the code, and the code works


### Terraform for cloud configuration

Terraform was used for configuration of the cloud resources in Google Cloud. Terraform is a IaC (Infrastructure as code) platform, which allows the user to design, setup, update and ultimately, destroy resources within the cloud. 

IaC is highly desirable, as it enables developers in important aspects such as more control of resources in the cloud, which in the end, translates into financial costs. But apart from this, it allows for consistency among different resources, speed when setting up, ease of management of these resources and versioning. This might be only scratching the surface, but the point is made.

In this project, Terraform was used to setup the bucket (qr_art_gallery) and two BigQuery Datasets (or schemas, in other Data Warehouses), qr_art_gallery_raw and qr_art_gallery_transformed, where the former will hold tabular raw data, and the latter will hold transformed data.

### Kestra for orchestration






