import java.io.*;

public class Paint
{
	public static void main(String argv[])throws Exception
	{
		if(argv.length==0)
		{
			// no input
		}
		else
		{
			for(int i=0;i<argv.length;i++){
				//Scanner
				Scanner obj = new Scanner(new java.io.FileReader(argv[i]));
				parser p=new parser (obj);
				try{
					p.parse();
				}catch (Exception excep){
					System.out.println(excep.getMessage());
				}
				System.out.println();
			}
		}
	}
}