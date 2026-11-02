package com.tgame.moudels.loadres.controller
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.FacadeManager;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.RslLoaderManager;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LoadRes_LoadLoginCommand extends SimpleCommand
   {
      
      public function LoadRes_LoadLoginCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         TPreLoader.showPreLoadingUI(LanResManager.getLanTextWords(this,"正在加载登陆模块"));
         var _loc2_:Array = [];
         _loc2_.push(new LoadData(ResPathManager.getProgramPath_SWF(GameConfig.login.@url),null,this.loadUpdate,null,GameConfig.login.@name,GameConfig.login.@key,0,GameConfig.decode));
         RslLoaderManager.load(_loc2_,this.loadComplete);
      }
      
      public function loadUpdate(param1:LoadData, param2:*) : void
      {
         var _loc3_:Number = NaN;
         if(param2 is Number)
         {
            _loc3_ = param2;
         }
         else if(param2.hasOwnProperty("weightPercent"))
         {
            _loc3_ = Number(param2.weightPercent);
         }
         else
         {
            _loc3_ = param2.bytesLoaded / param2.bytesTotal;
         }
         TPreLoader.updatePreLoadingUI(_loc3_);
      }
      
      private function loadComplete() : void
      {
         GameState.loadThread1Complete = true;
         FacadeManager.startupFacade(PipeConstants.STARTUP_ENGINE);
         FacadeManager.startupFacade(PipeConstants.STARTUP_SCENE);
         FacadeManager.startupFacade(PipeConstants.STARTUP_MAINCHAR);
         FacadeManager.startupFacade(PipeConstants.STARTUP_LOGIN);
      }
   }
}

