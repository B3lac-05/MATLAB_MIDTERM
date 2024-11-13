% Author Name: Caleb CLair
% Email: Clairc68@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Homework 2
% Date: 11-11-24




%%Not sure what this does someone said to add it
clear; clc;

% Initialize the database
db = StudentDatabase();

% addd sample students
db = db.addStudent(Student(1, 'Alison', 20, 3.8, 'Computer Science'));
db = db.addStudent(Student(2, 'Bob', 22, 3.5, 'Mathematics'));
db = db.addStudent(Student(3, 'Charly', 21, 3.2, 'Engineering'));
db = db.addStudent(Student(4, 'Donna', 23, 3.7, 'Biology'));
db = db.addStudent(Student(5, 'Hunter', 19, 3.9, 'Physics'));

% displays all students
fprintf('Student List:\n');
for i = 1:length(db.Students)
    db.Students(i).displayInfo();
end

% save and load database
db.saveDatabase('studentDB.mat');
db = db.loadDatabase('studentDB.mat');

% search by ID and other info
student = db.findStudentByID(2);
if ~isempty(student)
    fprintf('\nFound Student by ID 2:\n');
    student.displayInfo();
end

% Get and display students by major
fprintf('\nStudents in Computer Science:\n');
csStudents = db.getStudentsByMajor('Computer Science');
for i = 1:length(csStudents)
    csStudents(i).displayInfo();
end

% generate figures
figure;
db.plotGPADistribution();

figure;
db.plotAverageGPAByMajor();

figure;
db.plotAgeDistribution();


%hopefully it works (: