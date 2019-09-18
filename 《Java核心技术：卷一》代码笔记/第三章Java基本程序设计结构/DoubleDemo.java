/*	double的NaN,Infinity和-Infinity	*/
public class DoubleDemo
{
	public static void main(String[] arg)
	{
		double b = 0.0/0.0;
		// 或double b = 0/0.0
		// 或double b = 0.0/0;
		// double b = 0/0; 会报错
		System.out.println(b); // NaN
		System.out.println(Double.isNaN(b)); // true

		double a = Double.POSITIVE_INFINITY;
		double c = 1.0/0;
		double d = -1.0/0;
		System.out.println(a); // Infinity
		System.out.println(c); // Infinity
		System.out.println(d); // -Infinity
	}
}
