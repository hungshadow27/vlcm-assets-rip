package com.tgame.moudels.fight.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NoticeManager;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Fight_LianZhanProxy extends Proxy
   {
      
      public static const NAME:String = "Fight_LianZhanProxy";
      
      public function Fight_LianZhanProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      public function lianzhan(param1:int, param2:int) : void
      {
         var _loc4_:int = 0;
         if(param2 != 0)
         {
            GameInstance.mainCharData.lianzhanInfo.count = param2;
            GameInstance.mainCharData.lianzhanInfo.lastTime = GameInstance.mainCharData.lianzhanInfo.time;
            GameInstance.uiInstance.mainUI.setCombo(param1,param2);
         }
         else
         {
            _loc4_ = GameInstance.mainCharData.lianzhanInfo.lastTime;
            GameInstance.mainCharData.lianzhanInfo.count = 0;
            NoticeManager.notify(NoticeManager.FOOT,_loc4_ / 1000 + LanResManager.getLanTextWords(this,"连斩中断"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_ / 1000 + LanResManager.getLanTextWords(this,"连斩中断"));
         }
         if(param2 == 0)
         {
            GameInstance.uiInstance.mainUI.showComboEffect(0);
            return;
         }
         var _loc3_:int = param2 % 10;
         if(_loc3_ == 0)
         {
            _loc3_ = 10;
         }
         GameInstance.uiInstance.mainUI.showComboEffect(_loc3_);
      }
   }
}

