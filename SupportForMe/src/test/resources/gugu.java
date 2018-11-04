
public class gugu {

	
		System.out.println("값을 입력하세요");
		Scanner sc= new Scanner(System.in);
		int a;
		a = sc.nextInt();
		for(int x=1; x<=9; x++) {
			for(int y=1; y<=9; y++) {
				System.out.print(x+"*"+y+"="+(x*y)+"\t");
			}
			System.out.println();
		}
		

}
