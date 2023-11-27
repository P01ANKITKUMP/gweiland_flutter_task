import 'dart:math';

extension RandomNumberGenerator on Random {
  int nextRandomNumber() => nextInt(60);
}

extension RandomAndTimestampComparison on Random {
  bool isRandomEqualToTimestampSeconds(int randomValue) {
    int currentTimestampSeconds =
        DateTime.now().second; // Get current timestamp in seconds
    return currentTimestampSeconds == randomValue;
  }
}
