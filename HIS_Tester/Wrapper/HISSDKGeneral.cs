extern alias HIS;
extern alias HIS_TestMode_2_KeyA2;
extern alias HIS_OperationalMode_2_KeyA2;
extern alias HIS_OperationalMode_2_KeyA3;
extern alias HIS_TestMode_2_KeyA3;


namespace Wrapper_HIS_SDK_General
{
    public class HIS_SDK
    {
        public HIS.SDK.Service Service = new HIS.SDK.Service();

    }

    public class HISTestMode2KeyA2_SDK
    {
        
        public HIS_TestMode_2_KeyA2.SDK.Service Service = new HIS_TestMode_2_KeyA2.SDK.Service();

    }

    public class HISTestMode2KeyA3_SDK
    {
        public HIS_TestMode_2_KeyA3.SDK.Service Service = new HIS_TestMode_2_KeyA3.SDK.Service();

    }
    public class HISOperationalMode2KeyA2_SDk
    {
        public HIS_OperationalMode_2_KeyA2.SDK.Service Service = new HIS_OperationalMode_2_KeyA2.SDK.Service();
        
    }
    public class HISOperationalMode2KeyA3_SDK
    {
        public HIS_OperationalMode_2_KeyA3.SDK.Service Service = new HIS_OperationalMode_2_KeyA3.SDK.Service();

    }
}
