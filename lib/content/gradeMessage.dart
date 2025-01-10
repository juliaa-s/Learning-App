String gradeMessage(double grade) {
  if (grade >= 9.5 && grade <= 10)
    return "Amazing! You're at the top!";
  else if (grade >= 8.0 && grade < 9.5)
    return "Great job! Keep up the good work!";
  else if (grade >= 6.5 && grade < 8.0)
    return "Good effort! You're doing well!";
  else if (grade >= 5.0 && grade < 6.5)
    return "Not bad! Keep working, you can do even better!";
  else
    return "Don't give up! Keep pushing, you'll improve!";
}
