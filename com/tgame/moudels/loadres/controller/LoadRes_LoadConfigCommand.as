package com.tgame.moudels.loadres.controller
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.moudels.loadres.LoadRes_ApplicationFacade;
   import com.zcp.common.codemix.ZZip;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.privatehome.PrivateHome;
   import com.zcp.manager.LoaderManager;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LoadRes_LoadConfigCommand extends SimpleCommand
   {
      
      private static var privateHome:PrivateHome = new PrivateHome();
      
      public function LoadRes_LoadConfigCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         TPreLoader.showPreLoadingUI(LanResManager.getLanTextWords(this,"正在加载主配置文件"));
         var _loc2_:* = LoaderManager.creatNewLoader("configLoader",this.loadComplete,this.loadUpdate);
         privateHome.addObject(_loc2_);
         var _loc3_:Array = [new LoadData(GameConfig.flashParameters["config"],this.itemLoadComplete)];
         LoaderManager.load(_loc3_,_loc2_);
      }
      
      public function loadUpdate(param1:*) : void
      {
         var _loc2_:Number = NaN;
         if(param1 is Number)
         {
            _loc2_ = param1;
         }
         else if(param1.hasOwnProperty("weightPercent"))
         {
            _loc2_ = Number(param1.weightPercent);
         }
         else
         {
            _loc2_ = param1.bytesLoaded / param1.bytesTotal;
         }
         TPreLoader.updatePreLoadingUI(_loc2_);
      }
      
      private function loadComplete(param1:Event) : void
      {
         privateHome.clear();
         sendNotification(LoadRes_ApplicationFacade.LOAD_SKIN);
         sendNotification(LoadRes_ApplicationFacade.LOAD_RSL);
      }
      
      private function itemLoadComplete(param1:Event) : void
      {
         var _loc2_:* = undefined;
         if(!param1.target)
         {
            return;
         }
         if(param1.target is LoadingItem)
         {
            _loc2_ = param1.target.content;
         }
         else
         {
            _loc2_ = param1.target.data;
         }
         if(GameConfig.decode != null)
         {
            _loc2_ = ZZip.extractFristTextFileContent(_loc2_,GameConfig.decode);
            if(_loc2_ == "")
            {
               return;
            }
         }
         var _loc3_:XML = XML(_loc2_);
         if(!_loc3_)
         {
            return;
         }
         GameConfig.skinXml = XML(_loc3_.skinxml);
         GameConfig.skinSwf = XML(_loc3_.skinswf);
         GameConfig.login = XML(_loc3_.login);
         GameConfig.rsls = XML(_loc3_.rsls).children();
         GameConfig.xmls = XML(_loc3_.xmls).children();
      }
   }
}

