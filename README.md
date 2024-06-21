# web_application
A company wants to deploy a highly available and scalable web application on AWS.

# Architecture Diagram
                                    +-------------+
                                    | GitHub Repo |
                                    +-------------+
                                           |
                                           v
+----------------+               +----------------+               +----------------+               +----------------+
|                |               |                |               |                |               |                |
|  AWS CodeBuild |   Triggers    | AWS CodePipeline |   Deploys   |   AWS Amplify  |   Hosts &    |  React/Next.js |
|   (Backend)    +-------------> +  (Backend)    +-------------> +   (Frontend)   +-------------> +   Frontend     |
|                |               |                |               |                |               |                |
+----------------+               +----------------+               +----------------+               +----------------+
                                           |
                                           v
                                    +----------------+
                                    |  AWS CodeBuild |
                                    |    (Frontend)  |
                                    +----------------+
                                           |
                                           v
                                  +------------------+
                                  |    AWS Lambda    |
                                  | (Node.js Backend)|
                                  +------------------+
                                           |
                                           v
                                  +------------------+
                                  |   Amazon RDS     |
                                  |   (MySQL DB)     |
                                  +------------------+
