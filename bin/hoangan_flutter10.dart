void main() {
  ///bai 1
  List<List<int>> inputMatrix = [
    [1, 2, 3, 4, 5],
    [2, 3, 4, 1, 1],
    [1, 2, 9, 3, 1],
    [2, 1, 1, 4, 2],
    [3, 2, 4, 1, 3],
  ];
  print(matrix(inputMatrix));

  ///bai 2
  print("=========bai 2==========");
  // List<int> inputNumlist = [1, 2, 3, 4, 5];
  List<int> inputNumlist = [2, 4, 6, 8];
  print(optimalActions(inputNumlist));

  ///bai 3
  print("=========bai 3==========");
  // int totalTree = 5;
  int totalTree = 4;
  // List<int> treeHeight = [1, 3, 3, 4, 1];
  List<int> treeHeight = [1, 1, 1, 1];
  print(totalFlags(totalTree, treeHeight));

  /// bai 4
  print("=========bai 4==========");
  // int timeStart = 9;
  int timeStart = 9;
  // int timeUntillBegin = 12;
  int timeUntillBegin = 21;
  print(outputTime(timeStart, timeUntillBegin));

  ///bai 5
  print("=========bai 5==========");
  List<int> people = [3, 5, 4, 2];
  int limit = 5;
  print(totalBoats(people, limit));
}

/// Bai 1
int matrix(List<List<int>> inputMatrix) {
  int total = 0;
  int centerNum = 0;

  if (inputMatrix.length % 2 != 0) {
    for (int i = 0; i < inputMatrix.length; i++) {
      if (inputMatrix[i].length != inputMatrix.length) {
        print("ma tran khong co duong giao diem 2 duong cheo");
        break;
      } else {
        for (int j = 0; j < inputMatrix[i].length; j++) {
          if (i == j) {
            if (j == (inputMatrix[i].length ~/ 2) && i == (inputMatrix.length ~/ 2)) {
              centerNum = inputMatrix[i][j];
            }
          }
        }
      }
    }
  }
  if (centerNum != 0 && centerNum != 1) {
    for (int i = 2; i < (centerNum ~/ 2); i++) {
      if (centerNum % i == 0) {
        centerNum = 0;
      }
    }
  }

  if (centerNum == 0) {
    for (int i = 0; i < inputMatrix.length; i++) {
      for (int j = 0; j < inputMatrix[i].length; j++) {
        if (i == j && inputMatrix[i][j] % 2 == 0) {
          total += inputMatrix[i][j];
        }
      }
    }
  }

  return total;
}

/// Bai 2
int optimalActions(List<int> inputNumlist) {
  int actions = 0;
  int even = 0; //luu tong so chan
  int odd = 0; // luu tong so le

  for (int i = 0; i < inputNumlist.length; i++) {
    if (inputNumlist[i] % 2 == 0) {
      even += 1;
    } else {
      odd += 1;
    }
  }

  if (even > odd) {
    actions = odd;
  } else {
    actions = even;
  }

  return actions;
}

/// Bai 3
int totalFlags(int totalTree, List<int> treeHeight) {
  int totalflags = 0;
  List<int> checkHeight = List<int>.from(treeHeight);
  checkHeight.sort();

  if (totalTree == treeHeight.length) {
    for (int i = 0; i < treeHeight.length; i++) {
      if (treeHeight[i] == checkHeight.first) {
        totalflags += 1;
      } else if (treeHeight[i] == checkHeight.last) {
        totalflags += 1;
      }
    }
  }

  return totalflags;
}

/// Bai 4
int outputTime(int timeStart, int timeUntillBegin) {
  int totalTime = 0;
  if (0 <= timeStart &&
      timeStart <= 23 &&
      0 <= timeUntillBegin &&
      timeUntillBegin <= 23) {
    totalTime = timeStart + timeUntillBegin;
    if (totalTime > 24) {
      totalTime = totalTime % 24;
    }
  }

  return totalTime;
}

/// Bai 5
int totalBoats(List<int> people, int limit) {
  int boats = 0;
  List<int> checkWeigth = List<int>.from(people);

  for (int i = 0; i < people.length; i++) {
    int checkBoats = 0;
    if (people[i] <= limit) {
      for (int j = 1; j < checkWeigth.length; j++) {
        if (people[i] + checkWeigth[j] <= limit) {
          if (people[i] + checkWeigth[j] > checkBoats) {
            checkBoats = people[i] + checkWeigth[j];
            boats += 1;
          }
        }
      }
      checkWeigth.remove(checkBoats - people[i]);
      if (checkBoats != 0) {
        checkWeigth.remove(people[i]);
      }
    }
  }
  checkWeigth.length;
  boats = boats + checkWeigth.length;

  return boats;
}
