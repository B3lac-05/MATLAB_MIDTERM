% Author Name: Caleb CLair
% Email: Clairc68@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Homework 2
% Date: 11-11-24



classdef StudentDatabase    %%defines the class
    properties
        Students    %% creates array of Student objects
    end
    
    methods
    
        function obj = StudentDatabase()        % constructor
            obj.Students = [];
        end
        

        function obj = addStudent(obj, student)        % methods to add a new student
            obj.Students = [obj.Students; student];
        end
        
     
        function student = findStudentByID(obj, id)          % method to find student by ID
            student = [];
            for i = 1:length(obj.Students)
                if obj.Students(i).ID == id
                    student = obj.Students(i);
                    return;
                end
            end
        end
        
        
        function studentsByMajor = getStudentsByMajor(obj, major)        % method to get list of students by major
            studentsByMajor = obj.Students(strcmp({obj.Students.Major}, major));
        end
        
        function saveDatabase(obj, filename)          % method to save database to mat file

            students = obj.Students; 
            save(filename, 'students');
        end
        
     
        function obj = loadDatabase(obj, filename)        % method to load database from mat file
            data = load(filename);
            obj.Students = data.students;
        end
        
       
        function plotGPADistribution(obj)     % Visualization- GPA bar graph
            gpas = [obj.Students.GPA];
            histogram(gpas);
            title('GPA Distribution');
            xlabel('GPA');
            ylabel('Number of students');
        end
        
        
        function plotAverageGPAByMajor(obj)         % visualization - Average GPA vs major
            majors = unique({obj.Students.Major});
            avgGPAs = zeros(size(majors));
            
            for i = 1:length(majors)
                major = majors{i};
                majorGPAs = [obj.Students(strcmp({obj.Students.Major}, major)).GPA];
                avgGPAs(i) = mean(majorGPAs);
            end
            
            bar(categorical(majors), avgGPAs);
            title('Average GPA by major');
            xlabel('Major');
            ylabel('Average GPA');
        end
        
    
        function plotAgeDistribution(obj)           % visualization - Ages 
            ages = [obj.Students.Age];
            histogram(ages);
            title('Age Distribution');
            xlabel('Age');
            ylabel('Number of students');
        end
    end
end
