using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;

namespace ConsoleApp1
{
    public interface IEmailNotify
    {
        void Notify();
    }

    public interface ISMSNotify
    {
        void Notify();
    }

    public interface INamed
    {
        string Name { get; set; }

        void PrintName();
    }
    public class Car : INamed, IEmailNotify, ISMSNotify
    {
        public string Name { get; set; }
        public void PrintName()
        {
            Console.WriteLine(Name);
        }

        void IEmailNotify.Notify()
        {
            Console.WriteLine("Notify via Email!");
        }

        void ISMSNotify.Notify()
        {
            Console.WriteLine("Notify via SMS!");
        }
    }

    public delegate void MethodPointer(int number1, int number2);


    public class Student
    {
        public Student(string studentId, string firstName, string lastName, byte age)
        {
            StudentId = studentId;
            FirstName = firstName;
            LastName = lastName;
            Age = age;
        }

        public string StudentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public byte Age { get; set; }
    }

    class Program
    {
        public static void Sum(int number1, int number2)
        {
            Console.WriteLine(number1 + number2);

        }

        public static void Substract(int number1, int number2)
        {
            Console.WriteLine(number1 - number2);
        }

        class MyGenericClass<T>
        {
            private T genericMemberVariable;

            public MyGenericClass(T value)
            {
                genericMemberVariable = value;
            }

            public T genericMethod(T genericParameter)
            {
                Console.WriteLine("Parameter type: {0}, value: {1}", typeof(T).ToString(), genericParameter);
                Console.WriteLine("Return type: {0}, value: {1}", typeof(T).ToString(), genericMemberVariable);

                return genericMemberVariable;
            }

            public T genericProperty { get; set; }
        }

        static bool isPositiveInt(int i)
        {
            return i > 0;
        }

        public delegate int MathAction(int number1, int number2);

        public static void DisplayResult(int n1, int n2, MathAction mathAction)
        {
            Console.WriteLine(mathAction(n1, n2));
        }

        public class Schedule
        {
            public void Exceute(Action run)
            {
                run();
            }
        }

        static long Factorial(int number)
        {
            if (number == 1)
                return 1;

            return number * Factorial(number - 1);
        }


        public TOut DoSomething<TOut, TParam1, TParam2>(TParam1 param1, TParam2 param2)
        {
            return default(TOut);
        }

        public interface IDiscount
        {
            double CalculateTax();
        }

        public class Product : IDiscount
        {
            public string Name { get; set; }
            public int Price { get; set; }

            public virtual double CalculateTax()
            {
                return 0;
            }
        }

        public class ProductManager<TProduct> where TProduct : Product
        {
            public double CalculatePrice(TProduct product)
            {
                return product.Price - product.CalculateTax();
            }
        }

        static void Main(string[] args)
        {
            //Console.WriteLine("Hello World!");
            //var car = new Car();

            ////car.Name = "Tets";
            //INamed carName = car;
            //carName.PrintName();
            //ISMSNotify smsNotify = car;
            //smsNotify.Notify();
            //IEmailNotify emailNotify = car;
            //emailNotify.Notify();
            //Console.ReadKey();

            using (var cnn = new SqlConnection("data source=.; initial catalog=SampleForBulkInsert; user id=sa; password=1"))
            {
                cnn.Open();
                for (int i = 0; i < 100000; i++)
                {
                    var command = cnn.CreateCommand();
                    command.CommandText = "insert into SampleTable values ('Hossein Ahmadi','Mohammad Nasiri',@date,10000);";
                    command.Parameters.Add(new SqlParameter("date", DateTime.UtcNow));
                    command.ExecuteNonQuery();
                }
            }
            sw.Stop();


            Regex regex = new Regex("^[a-zA-Z]+$");

            if (!regex.IsMatch("sdfsg2323"))
            {
            }

            Dictionary<string, Student> students = new Dictionary<string, Student>();
            students.Add("10001", new Student("10001", "Hossein", "Ahmadi", 30));
            students.Add("10002", new Student("10002", "Mohammad", "Nasiri", 30));

            string[] fruits = { "apple", "passionfruit", "banana", "mango",
                      "orange", "blueberry", "grape", "strawberry" };

            IEnumerable<string> query =
                fruits.TakeWhile((fruit, index) => fruit.Length >= index);

            foreach (string fruit in query)
            {
                Console.WriteLine(fruit + " " + fruit.Length);

            }
            Console.WriteLine();
            foreach (string fruit in fruits)
            {

                Console.WriteLine(fruit + " " + fruit.Length + " " + fruits.Select((Value, Index) => new { Value, Index }).Single(p => p.Value == fruit).Index);

            }


            Func<(int, int, int), (int, int, int)> doubleThem = ns => (2 * ns.Item1, 2 * ns.Item2, 2 * ns.Item3);
            var numbers = (2, 3, 4);
            var doubledNumbers = doubleThem(numbers);
            Console.WriteLine($"The set {numbers} doubled: {doubledNumbers}");

            Action<int> printActionDel = delegate (int i)
            {
                Console.WriteLine(i);
            };

            printActionDel(10);

            Func<int, int, int> printActionDel1 = (i, j) => i * j;

            var mint = printActionDel1(10, 20);

            Console.WriteLine(Factorial(5));


            int[] numbers1 = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
            var firstSmallNumbers = numbers1.TakeWhile((n, index) => n >= index);
            Console.WriteLine(string.Join(" ", firstSmallNumbers));


            new Schedule().Exceute(() => Console.WriteLine("Just Run!"));

            Action<int> example1 = x => Console.WriteLine("Write {0}", x);
            example1(5);

            Func<int, string> example2 = x => string.Format("{0:n0}", x);
            Console.WriteLine(example2(5000));


            DisplayResult(2, 6, delegate (int n1, int n2) { return n1 + n2; });
            DisplayResult(2, 6, delegate (int n1, int n2) { return n1 * n2; });

            List<int> intList1 = new List<int>() { 10, 20, 30, 40 };

            bool res = intList1.TrueForAll(el => isPositiveInt(el));

            List<int> intList = new List<int>() { 10, 20, 30 };

            intList.ForEach(el => Console.WriteLine(el));

            MyGenericClass<int> intGenericClass = new MyGenericClass<int>(10);

            int val = intGenericClass.genericMethod(200);


            MethodPointer pointer = Sum;
            pointer += Substract;

            string str = "dgkl;ejgklsdgkl;\n";
            str += "erfggwewe";


            pointer(8, 3);

            string dummyLines = "This is first line." + Environment.NewLine +
                "This is second line." + Environment.NewLine +
                "This is third line.";

            //Opens DummyFile.txt and append lines. If file is not exists then create and open.
            File.AppendAllLines(@"C:\DummyFile.txt", dummyLines.Split(Environment.NewLine.ToCharArray()).ToList<string>());


            var members = new Members(new EmailManager());
            members.Register("Hossein", "Ahmadi");

            var members1 = new Members(new SmsManager());
            members1.Register("Hossein", "Ahmadi");

            var h = new ValueHolder(12);
            var h2 = new ValueHolder(10);
            int m = 17;

            for (double d = 1.01; d < 1.10; d += 0.01)
            {
                Console.WriteLine("Value of i: {0} {1}", d, 5);
            }

            Dictionary<int, string> dict = new Dictionary<int, string>();

            dict.Add(1, "one");
            dict.Add(2, "two");
            dict.Add(3, "three");

            Discounts saleDiscounts = new Discounts();

            saleDiscounts.Cloths = 10;
            saleDiscounts.HomeDecor = 5;
            saleDiscounts.Grocery = 2;

            WeekDays wd;

            int[][,,] intJaggedArray = new int[3][,,];
            intJaggedArray[0] = new int[3, 3, 3] { { { 1, 2, 3 }, { 1, 2, 3 },{ 1, 2, 3 } },
                                                   { { 1, 2, 3 }, { 1, 2, 3 },{ 1, 2, 3 } },
                                                   { { 1, 2, 3 }, { 1, 2, 3 },{ 1, 2, 3 } }
                                                    };


            ArrayList myArryList = new ArrayList();
            myArryList.Add(1);
            myArryList.Add("Two");
            myArryList.Add(3);
            myArryList.Add(4.5f);

            //int[][,] intJaggedArray = new int[3][,];

            //intJaggedArray[0] = new int[3, 2] { { 1, 2 }, { 3, 4 }, { 5, 6 } };
            //intJaggedArray[1] = new int[2, 2] { { 3, 4 }, { 5, 6 } };
            //intJaggedArray[2] = new int[2, 2];

            #region File

            //Create object of FileInfo for specified path            
            FileInfo fi = new FileInfo(@"C:\DummyFile.txt");

            //Open file for Read\Write
            FileStream fs = fi.Open(FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);

            //create byte array of same size as FileStream length
            byte[] fileBytes = new byte[fs.Length];

            //define counter to check how much bytes to read. Decrease the counter as you read each byte
            int numBytesToRead = (int)fileBytes.Length;

            //Counter to indicate number of bytes already read
            int numBytesRead = 0;

            //iterate till all the bytes read from FileStream
            while (numBytesToRead > 0)
            {
                int n = fs.Read(fileBytes, numBytesRead, numBytesToRead);

                if (n == 0)
                    break;

                numBytesRead += n;
                numBytesToRead -= n;
            }

            //Once you read all the bytes from FileStream, you can convert it into string using UTF8 encoding
            string filestring = Encoding.UTF8.GetString(fileBytes);
            #endregion

            //throw new NotImplementedException();

            Console.WriteLine((h + h2).Value);
            Console.WriteLine((h - h2).Value);
            Console.WriteLine((h * h2).Value);
            Console.WriteLine((h / h2).Value);
            Console.WriteLine(h < h2);
            Console.WriteLine(h > h2);
            Console.WriteLine((h++).Value);
            Console.WriteLine((h--).Value);
            Console.WriteLine((int)h);
            Console.WriteLine(((ValueHolder)m).Value);

            ValueHolderType<string> v = new ValueHolderType<string>();

            MultipleGeneric<int, string, string> mm = new MultipleGeneric<int, string, string>();

            mm.Value1 = 55;
            mm.Value2 = "ds";
            mm.Value3 = "2342";

            string result = mm.DoSomething<string, int, int>(12, 20);


            Console.ReadKey();



        }
        class StringDataStore
        {

            private double[] strArr = new double[10]; // internal data storage

            public object this[int index]
            {
                get
                {
                    if (index < 0 && index >= strArr.Length)
                        throw new IndexOutOfRangeException("Cannot store more than 10 objects");

                    return (double)strArr[index];
                }

                set
                {
                    if (index < 0 && index >= strArr.Length)
                        throw new IndexOutOfRangeException("Cannot store more than 10 objects");

                    strArr[index] = (double)value;
                }
            }
        }
        enum WeekDays
        {
            Monday,
            Tuesday,
            Wednesday,
            Thursday,
            Friday,
            Saturday,
            Sunday
        }
    }

    public struct Discounts
    {
        public int Cloths { get; set; }
        public int HomeDecor { get; set; }
        public int Grocery { get; set; }
    }

    public interface INotifySender
    {
        void Send(string message);
    }
    public class Members
    {
        private readonly INotifySender sender;

        public Members(INotifySender sender)
        {
            this.sender = sender;
        }

        public void Register(string firstName, string lastName)
        {
            // add member to database
            sender.Send("New member registered!");
        }
    }
    public class EmailManager : INotifySender
    {
        public void Send(string message)
        {
            // send message to name@host.com
        }
    }

    public class SmsManager : INotifySender
    {
        public void Send(string message)
        {
            // send sms to 0912*******
        }
    }

    class EventLogWriter
    {
        public void Write(string message)
        {
            //Write to event log here
        }
    }

    class AppPoolWatcher
    {
        // تنظیم کردن کلاس برای نوشتن پیام‌ها
        EventLogWriter writer = null;

        // این متد مشکلات را یادداشت می‌کرد
        public void Notify(string message)
        {
            if (writer == null)
            {
                writer = new EventLogWriter();
            }
            writer.Write(message);
        }
    }

    public class ValueHolder
    {
        public ValueHolder(int value)
        {
            Value = value;
        }

        public int Value { get; set; }

        public static ValueHolder operator +(ValueHolder holder1, ValueHolder holder2)
        {
            return new ValueHolder(holder1.Value + holder2.Value);
        }

        public static ValueHolder operator -(ValueHolder holder1, ValueHolder holder2)
        {
            return new ValueHolder(holder1.Value - holder2.Value);
        }

        public static ValueHolder operator *(ValueHolder holder1, ValueHolder holder2)
        {
            return new ValueHolder(holder1.Value * holder2.Value);
        }

        public static ValueHolder operator /(ValueHolder holder1, ValueHolder holder2)
        {
            return new ValueHolder(holder1.Value / holder2.Value);
        }
        public static ValueHolder operator ++(ValueHolder holder)
        {
            return new ValueHolder(holder.Value++);
        }

        public static ValueHolder operator --(ValueHolder holder)
        {
            return new ValueHolder(holder.Value--);
        }
        public static bool operator <(ValueHolder holder1, ValueHolder holder2)
        {
            return holder1.Value < holder2.Value;
        }

        public static bool operator >(ValueHolder holder1, ValueHolder holder2)
        {
            return holder1.Value > holder2.Value;
        }
        public static implicit operator int(ValueHolder holder)
        {
            return holder.Value;
        }

        public static explicit operator ValueHolder(int value)
        {
            return new ValueHolder(value);
        }

    }
    public class ValueHolderType<T>
    {
        public T Value { get; set; }
    }
    public class MultipleGeneric<T1, T2, T3>
    {
        public T1 Value1 { get; set; }
        public T2 Value2 { get; set; }
        public T3 Value3 { get; set; }

        public TOut DoSomething<TOut, TParam1, TParam2>(TParam1 param1, TParam2 param2)
        {
            return default(TOut);
        }
    }
}
