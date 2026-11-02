package
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.KeyboardManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.display.*;
   import flash.utils.*;
   
   public class TPreLoader
   {
      
      private static var lockTD:TimerData;
      
      public static var bFirstShowed:Boolean = false;
      
      public function TPreLoader()
      {
         super();
      }
      
      public static function showPreLoadingUI(param1:String) : void
      {
         GameInstance.app.dispatchEvent(new BaseEvent("LoadingUI","showLoadingUI",{"loadTarget":param1}));
      }
      
      public static function hidePreLoadingUI() : void
      {
         GameInstance.app.dispatchEvent(new BaseEvent("LoadingUI","hideLoadingUI"));
      }
      
      public static function updatePreLoadingUI(param1:Number) : void
      {
         GameInstance.app.dispatchEvent(new BaseEvent("LoadingUI","updateLoadingUI",{"per":param1}));
      }
      
      public static function startLock(param1:String, param2:int) : void
      {
         var onUpdate:Function = null;
         var onComplete:Function = null;
         var $msg:String = param1;
         var $time:int = param2;
         onUpdate = function(param1:Number):void
         {
            updateLoadingUI($msg,param1 / $time,false);
         };
         onComplete = function():void
         {
            hideLoadingUI(false);
            KeyboardManager.enable = true;
         };
         showLoadingUI($msg,false);
         KeyboardManager.enable = false;
         lockTD = TimerManager.createExactTimer($time,0,$time,onUpdate,onComplete,1);
      }
      
      public static function stopLock() : void
      {
         hideLoadingUI(false);
         KeyboardManager.enable = true;
      }
      
      private static function clearLockTD() : void
      {
         if(lockTD != null)
         {
            TimerManager.deleteTimer(lockTD);
            lockTD = null;
         }
      }
      
      public static function showLoadingUI(param1:String, param2:Boolean = true) : void
      {
         if(!param2 || GameState.hasSelectedChar)
         {
            clearLockTD();
            if(!Fun.isVisible(GameInstance.uiInstance._loadingBar))
            {
               GameInstance.uiInstance.loadingBar.show();
            }
            GameInstance.uiInstance.loadingBar.setPercentage(param1,0);
         }
      }
      
      public static function hideLoadingUI(param1:Boolean = true) : void
      {
         if(!param1 || GameState.hasSelectedChar)
         {
            clearLockTD();
            GameInstance.uiInstance.loadingBar.hide();
         }
         if(GameState.hasSelectedChar && !bFirstShowed)
         {
            bFirstShowed = true;
            GameInstance.uiInstance.loadingBar.changeLoadingBar();
         }
      }
      
      public static function updateLoadingUI(param1:String, param2:Number, param3:Boolean = true) : void
      {
         if(!param3 || GameState.hasSelectedChar)
         {
            if(!Fun.isVisible(GameInstance.uiInstance._loadingBar))
            {
               GameInstance.uiInstance.loadingBar.show();
            }
            GameInstance.uiInstance.loadingBar.setPercentage(param1,Math.round(param2 * 100));
         }
      }
   }
}

