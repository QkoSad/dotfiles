Vim�UnDo� YPk�G���βC��v
cd�d���x����*�      *ENV VITE_BACKEND_URL=http://localhost:3000                             f�z�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             f��9    �                   �               5��                                           �       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             f��     �               �               5��                                         �      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             f��     �                2# The first FROM is now a stage called build-stage5��                                 3               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        f��     �                 FROM node:20       WORKDIR /usr/src/app       COPY . .5��                                   -               5�_�                    	        ����                                                                                                                                                                                                                                                                                                                            	                      V        f��     �      	       	   FROM node:20 AS build-stage        *ENV VITE_BACKEND_URL=http://localhost:3000       WORKDIR /usr/src/app       COPY . .       
RUN npm ci5��           	               �       u               5�_�                            ����                                                                                                                                                                                                                                                                                                                            	           	           V        f��     �             �             5��                   	                      u       5�_�                    
        ����                                                                                                                                                                                                                                                                                                                            
                      V        f��     �   	   
          
RUN npm ci   K# Change npm ci to npm install since we are going to be in development mode5��    	                      k       W               5�_�      	                      ����                                                                                                                                                                                                                                                                                                                            
           
           V        f��     �                RUN npm run build5��                          �                      5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                            
           
           V        f��     �             �             5��                          |                      5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                            
           
           V        f��     �             5��                          �                      5�_�   
                         ����                                                                                                                                                                                                                                                                                                                            
           
           V        f��     �                `# This is a new stage, everything before this is gone, except for the files that we want to COPY5��                                a               5�_�                            ����                                                                                                                                                                                                                                                                                                                            
           
           V        f��     �                 5��                                               5�_�                            ����                                                                                                                                                                                                                                                                                                                            
           
           V        f��     �                 5��                                               5�_�                            ����                                                                                                                                                                                                                                                                                                                            
           
           V        f��     �                 5��                                               5�_�                            ����                                                                                                                                                                                                                                                                                                                            
           
           V        f��     �                 5��                                               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        f��     �                G# COPY the directory dist from the build-stage to /usr/share/nginx/html   =# The target location here was found from the Docker hub page5��                                �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        f��     �                RUN npm run build       I# npm run dev is the command to start the application in development mode5��                          |       ]               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        f��   	 �                FROM nginx:1.25-alpine           ?COPY --from=build-stage /usr/src/app/dist /usr/share/nginx/html5��                          �       Y               5�_�                      &    ����                                                                                                                                                                                                                                                                                                                                                             f�xz     �               *ENV VITE_BACKEND_URL=http://localhost:30005��       &                 E                     5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                             f�x}    �               *ENV VITE_BACKEND_URL=http://localhost:80805��       *                  I                      5�_�                       .    ����                                                                                                                                                                                                                                                                                                                                                             f�z'     �               .ENV VITE_BACKEND_URL=http://localhost:8080/api5��       +              	   J              	       5�_�                       2    ����                                                                                                                                                                                                                                                                                                                                                             f�z3     �               4ENV VITE_BACKEND_URL=http://localhost:8080/api/todso5��       2                  Q                      5�_�                       3    ����                                                                                                                                                                                                                                                                                                                                                             f�z5    �               3ENV VITE_BACKEND_URL=http://localhost:8080/api/todo5��       3                  R                      5�_�                        4    ����                                                                                                                                                                                                                                                                                                                                                             f�z�    �               4ENV VITE_BACKEND_URL=http://localhost:8080/api/todos5��       /                  N                      5�_�                      *    ����                                                                                                                                                                                                                                                                                                                                                             f�xW     �               *ENV VITE_BACKEND_URL=http://localhost:80805��       &                 E                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             f��    �              5��                          �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             f�)(    �               'ENV VITE_BACKEND_URL=http://server:30005��              	          ;       	              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             f�3�     �               *ENV VITE_BACKEND_URL=http://localhost:30005��                     	   ;              	       5�_�                          ����                                                                                                                                                                                                                                                                                                                                                             f�.X     �               &ENV VITE_BACKEND_URL=http://nginx:30005��                        ;                     5�_�                       "    ����                                                                                                                                                                                                                                                                                                                                                             f�.[     �               *ENV VITE_BACKEND_URL=http://nginx:8080/api5��       "                 A                     5�_�                        *    ����                                                                                                                                                                                                                                                                                                                                                             f�.l    �               +ENV VITE_BACKEND_URL=http://nginx:8080/api/5��       *                  I                      5��