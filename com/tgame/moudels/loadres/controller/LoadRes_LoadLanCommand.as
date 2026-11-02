package com.tgame.moudels.loadres.controller
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.StaticValueManager;
   import com.tgame.moudels.loadres.LoadRes_ApplicationFacade;
   import com.zcp.common.codemix.ZZip;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.privatehome.PrivateHome;
   import com.zcp.manager.LoaderManager;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LoadRes_LoadLanCommand extends SimpleCommand
   {
      
      private static var privateHome:PrivateHome = new PrivateHome();
      
      public function LoadRes_LoadLanCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var loadList:Array = null;
         var $note:INotification = param1;
         var addLan:Function = function(param1:String):void
         {
            var _loc2_:String = GameConfig.flashParameters[param1];
            TVersion.addResKeyBaseUrlVersion(param1,_loc2_,TVersion.getResVersionByKey(param1));
            var _loc3_:String = TVersion.getResUrlByKey(param1);
            var _loc4_:LoadData = new LoadData(_loc3_,itemLoadComplete,null,null,"",param1);
            loadList.push(_loc4_);
         };
         var loader:* = LoaderManager.creatNewLoader("lanXmlLoader",this.loadComplete,this.loadUpdate);
         privateHome.addObject(loader);
         loadList = [];
         addLan("lan_font");
         addLan("lan_notice");
         addLan("lan_text");
         addLan("lan_offset");
         LoaderManager.load(loadList,loader);
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
         StaticValueManager.init();
         sendNotification(LoadRes_ApplicationFacade.LOAD_CONFIG);
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
         var _loc3_:String = (param1.target as LoadingItem)._id;
         switch(_loc3_)
         {
            case "lan_font":
               LanResManager.parseLanFontRes(_loc2_);
               Tools.font = LanResManager.getLanFont("TUILib#宋体");
               break;
            case "lan_notice":
               LanResManager.parseLanNoticeRes(_loc2_);
               break;
            case "lan_text":
               LanResManager.parseLanTextRes(_loc2_);
               break;
            case "lan_offset":
               LanResManager.parseLanOffsetRes(_loc2_);
         }
      }
   }
}

