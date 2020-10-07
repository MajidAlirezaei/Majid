using System;

namespace WebApplication1
{
    public class Test
    {

        public void test()
        {
            int myNum = 4;
            var pow = myNum.Pow(3);
            Console.WriteLine(pow);
        }


    }
    public static class IntExtensions
    {
        public static int Pow(this int number, int pow)
        {  
            int result = 1;
            for (int counter = 0; counter < pow; counter++)
                result = result * number;
            return result;
        }


    }

    public interface IName
    {
        public int MyProperty { get; set; }

        void sMain(string[] args);
    }

    class MyClass : IName
    {
        public int MyProperty { get ; set; }
        
        public void sMain(string[] args)
        {
            throw new NotImplementedException();
        }
    }
}


