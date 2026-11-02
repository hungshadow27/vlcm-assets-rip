package com.tgame.moudels.loadres.controller
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.init.SkinInit;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.moudels.loadres.LoadRes_ApplicationFacade;
   import com.zcp.common.codemix.ZZip;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.privatehome.PrivateHome;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.RslLoaderManager;
   import flash.events.Event;
   import game.UIConfig;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LoadRes_LoadSkinCommand extends SimpleCommand
   {
      
      private static var privateHome:PrivateHome = new PrivateHome();
      
      public function LoadRes_LoadSkinCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this.loadSkinSwf();
      }
      
      private function loadSkinSwf() : void
      {
         TPreLoader.showPreLoadingUI(LanResManager.getLanTextWords(this,"正在加载界面类库"));
         var _loc1_:Array = [];
         _loc1_.push(new LoadData(ResPathManager.getProgramPath_SWF(GameConfig.skinSwf.@url),null,this.loadUpdate_swf,null,GameConfig.skinSwf.@name,GameConfig.skinSwf.@key,0,GameConfig.decode));
         RslLoaderManager.load(_loc1_,this.loadComplete_swf);
      }
      
      public function loadUpdate_swf(param1:LoadData, param2:*) : void
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
      
      private function loadComplete_swf() : void
      {
         this.loadSkinXml();
      }
      
      private function loadSkinXml() : void
      {
         TPreLoader.showPreLoadingUI(LanResManager.getLanTextWords(this,"正在加载界面配置"));
         var _loc1_:* = LoaderManager.creatNewLoader("skinXmlLoader",this.loadComplete_xml,this.loadUpdate_xml);
         privateHome.addObject(_loc1_);
         var _loc2_:Array = [new LoadData(ResPathManager.getProgramPath_XML(GameConfig.skinXml.@url),this.itemLoadComplete_xml,null,null,"",GameConfig.skinXml.@key,0,GameConfig.decode)];
         LoaderManager.load(_loc2_,_loc1_);
      }
      
      private function loadUpdate_xml(param1:*) : void
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
      
      private function loadComplete_xml(param1:Event) : void
      {
         privateHome.clear();
         sendNotification(LoadRes_ApplicationFacade.LOAD_LOGIN);
      }
      
      private function itemLoadComplete_xml(param1:Event) : void
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
         SkinInit.initConfig(GameInstance.stage,_loc3_);
         StaticValue.setAlert();
         UIConfig.ResRootURL = GameConfig.fileBaseFolder + GameConfig.program + "/skin/";
         UIConfig.decode = GameConfig.decode;
         UIConfig.ResType = ResPathManager.eName_SWF;
      }
   }
}

