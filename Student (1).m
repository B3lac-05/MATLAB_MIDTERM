% Author Name: Caleb CLair
% Email: Clairc68@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Homework 2
% Date: 11-11-24



classdef Student  %%start the student class
    properties
        ID
        Name
        Age
        GPA
        Major
    end
    
    methods
        % Constructor
        function obj = Student(id, name, age, gpa, major)
            if nargin > 0
                obj.ID = id;
                obj.Name = name;
                obj.Age = age;
                obj.GPA = gpa;
                obj.Major = major;
            end
        end
        
        function displayInfo(obj)           % methods to display student information

            fprintf('ID: %d\nName: %s\nAge: %d\nGPA: %.2f\nMajor: %s\n', obj.ID, obj.Name, obj.Age, obj.GPA, obj.Major);
        end
        
        function obj = updateGPA(obj, newGPA)               % methods to update GPA

            obj.GPA = newGPA;
        end
    end
end
