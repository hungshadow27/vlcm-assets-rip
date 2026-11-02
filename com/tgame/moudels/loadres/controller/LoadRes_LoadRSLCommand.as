package com.tgame.moudels.loadres.controller
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.moudels.loadres.LoadRes_ApplicationFacade;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.RslLoaderManager;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LoadRes_LoadRSLCommand extends SimpleCommand
   {
      
      private var hasLoadNum:int;
      
      private var loadNum:int;
      
      public function LoadRes_LoadRSLCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var loadList:Array = null;
         var xml:XML = null;
         var $note:INotification = param1;
         var addRsl:Function = function(param1:XML):void
         {
            var _loc2_:String = ResPathManager.getProgramPath_SWF(param1.@url);
            var _loc3_:String = param1.@key;
            TVersion.addResKeyBaseUrlVersion(_loc3_,_loc2_,TVersion.getResVersionByKey(_loc3_));
            var _loc4_:String = TVersion.getResUrlByKey(_loc3_);
            var _loc5_:LoadData = new LoadData(_loc4_,itemLoadComplete,itemLoadUpdate,itemLoadError,param1.@name,_loc3_,0,GameConfig.decode);
            loadList.push(_loc5_);
            TLog.log_loadList += "【正在加载】" + _loc5_.url + "\n";
         };
         TPreLoader.showLoadingUI(LanResManager.getLanCommonTextWords("正在加载程序类库"));
         loadList = [];
         for each(xml in GameConfig.rsls)
         {
            addRsl(xml);
         }
         TLog.updateLoadXMLLog(TLog.log_loadList);
         this.hasLoadNum = 0;
         this.loadNum = loadList.length;
         RslLoaderManager.load(loadList,this.loadComplete);
      }
      
      public function itemLoadError(param1:LoadData, param2:*) : void
      {
         ++this.hasLoadNum;
         TLog.log_loadList = TLog.log_loadList.replace("【正在加载】" + param1.url,"【加载失败】" + param1.url);
         TLog.updateLoadXMLLog(TLog.log_loadList);
      }
      
      public function itemLoadComplete(param1:LoadData, param2:*) : void
      {
         ++this.hasLoadNum;
         TLog.log_loadList = TLog.log_loadList.replace("【正在加载】" + param1.url,"【加载完成】" + param1.url);
         TLog.updateLoadXMLLog(TLog.log_loadList);
      }
      
      public function itemLoadUpdate(param1:LoadData, param2:*) : void
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
         TPreLoader.updateLoadingUI(LanResManager.getLanCommonTextWords("正在加载程序类库"),(_loc3_ + this.hasLoadNum) / this.loadNum);
      }
      
      private function loadComplete() : void
      {
         sendNotification(LoadRes_ApplicationFacade.LOAD_XML);
      }
   }
}

