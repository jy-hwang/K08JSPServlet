package common;

public class MyClass {

	public int add(int num1, int num2) {

		return num1 + num2;

	}

	// 정수 num1 부터 정수 num2 까지의 합을 반환하는 정적 메서드
	public static int sum(int num1, int num2) {

		int sum = 0;

		for (int i = num1; i <= num2; i++) {

			sum += i;

		}

		return sum;

	}
}
