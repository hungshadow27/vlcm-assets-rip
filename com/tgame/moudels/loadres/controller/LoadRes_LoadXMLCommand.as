package com.tgame.moudels.loadres.controller
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.JiuYangShenGong.JiuYangShenGongManager;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.achieve.AchieveResManager;
   import com.tgame.common.res.activity.ActivityResManager;
   import com.tgame.common.res.anqi.AnqiResManager;
   import com.tgame.common.res.baguazhang.BaGuaZhangRESManager;
   import com.tgame.common.res.city.CityResManager;
   import com.tgame.common.res.combo.ComboResManager;
   import com.tgame.common.res.dugujiujian.DugujiujianManager;
   import com.tgame.common.res.equipMosaic.EquipMosaic;
   import com.tgame.common.res.girl.GirlResManager;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.instance.InstanceResManager;
   import com.tgame.common.res.jiami.Lan2ResManager;
   import com.tgame.common.res.jingmai.XueweiResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.lianti.LiantiResManager;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.monster.MonsterResManager;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.res.qihai.QihaiManager;
   import com.tgame.common.res.sceneMonster.SceneMonsterPointResManager;
   import com.tgame.common.res.shengwang.ShengWangGoodManager;
   import com.tgame.common.res.shouji.ShoujiResManager;
   import com.tgame.common.res.silingzhen.SiLingZhenResManager;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.res.tuteng.TuTengResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.ProcessManager;
   import com.zcp.common.codemix.ZZip;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.privatehome.PrivateHome;
   import com.zcp.manager.LoaderManager;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LoadRes_LoadXMLCommand extends SimpleCommand
   {
      
      private static var privateHome:PrivateHome = new PrivateHome();
      
      public function LoadRes_LoadXMLCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var loader:*;
         var loadList:Array = null;
         var xml:XML = null;
         var $note:INotification = param1;
         var addXml:Function = function(param1:XML):void
         {
            var _loc2_:String = ResPathManager.getProgramPath_XML(param1.@url);
            var _loc3_:String = param1.@key;
            TVersion.addResKeyBaseUrlVersion(_loc3_,_loc2_,TVersion.getResVersionByKey(_loc3_));
            var _loc4_:String = TVersion.getResUrlByKey(_loc3_);
            var _loc5_:LoadData = new LoadData(_loc4_,itemLoadComplete,null,itemLoadError,"",_loc3_);
            loadList.push(_loc5_);
            TLog.log_loadList += "【正在加载】" + _loc5_.url + "\n";
         };
         TPreLoader.showLoadingUI(LanResManager.getLanTextWords(this,"正在加载游戏资源配置"));
         loader = LoaderManager.creatNewLoader("mainXmlLoader",this.loadComplete,this.loadUpdate);
         privateHome.addObject(loader);
         loadList = [];
         for each(xml in GameConfig.xmls)
         {
            addXml(xml);
         }
         TLog.updateLoadXMLLog(TLog.log_loadList);
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
         TPreLoader.updateLoadingUI(LanResManager.getLanTextWords(this,"正在加载游戏资源配置"),_loc2_);
      }
      
      private function loadComplete(param1:Event) : void
      {
         TLog.disableUpdateLoadXMLLog(false);
         privateHome.clear();
         GameState.loadThread2Complete = true;
         ProcessManager.clientReady();
      }
      
      private function itemLoadError(param1:Event) : void
      {
         if(!param1.target)
         {
            return;
         }
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         TLog.log_loadList = TLog.log_loadList.replace("【正在加载】" + _loc2_.url.url,"【加载失败】" + _loc2_.url.url);
         TLog.updateLoadXMLLog(TLog.log_loadList);
      }
      
      private function itemLoadComplete(param1:Event) : void
      {
         var _loc3_:* = undefined;
         if(!param1.target)
         {
            return;
         }
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         TLog.log_loadList = TLog.log_loadList.replace("【正在加载】" + _loc2_.url.url,"【加载完成】" + _loc2_.url.url);
         TLog.updateLoadXMLLog(TLog.log_loadList);
         if(param1.target is LoadingItem)
         {
            _loc3_ = param1.target.content;
         }
         else
         {
            _loc3_ = param1.target.data;
         }
         if(GameConfig.decode != null)
         {
            _loc3_ = ZZip.extractFristTextFileContent(_loc3_,GameConfig.decode);
            if(_loc3_ == "")
            {
               return;
            }
         }
         var _loc4_:String = (param1.target as LoadingItem)._id;
         switch(_loc4_)
         {
            case "trans":
               MapTransManager.parseRes(_loc3_);
               break;
            case "sceneMonster":
               SceneMonsterPointResManager.parseRes(_loc3_);
               break;
            case "goodmodel":
               GoodsResManager.parseRes(_loc3_);
               break;
            case "monstermodel":
               MonsterResManager.parseRes(_loc3_);
               break;
            case "task":
               TaskResManager.parseTaskRes(_loc3_);
               break;
            case "task_dialog":
               TaskResManager.parseTaskDialogRes(_loc3_);
               break;
            case "activity":
               ActivityResManager.parseActivityRes(_loc3_);
               break;
            case "npc":
               NpcResManager.parseNpcRes(_loc3_);
               break;
            case "npc_trans":
               NpcResManager.parseTransRes(_loc3_);
               break;
            case "combo":
               ComboResManager.parseRes(_loc3_);
               break;
            case "skill":
               SkillResManager.parseSkillRes(_loc3_);
               break;
            case "skilleffect":
               SkillResManager.parseSkillEffectRes(_loc3_);
               break;
            case "xuewei":
               XueweiResManager.parseRes(_loc3_);
               break;
            case "xuewei_realdragon":
               XueweiResManager.parseRes_zhenlong(_loc3_);
               break;
            case "mountres":
               MountResManager.parseRes(_loc3_);
               break;
            case "leadStep":
               NewPlayerGuideStaticFun.parseNewPlayerRes(_loc3_);
               break;
            case "achievement":
               AchieveResManager.parseRes(_loc3_);
               break;
            case "instance":
               InstanceResManager.parseRes(_loc3_);
               break;
            case "shouji":
               ShoujiResManager.parseRes(_loc3_);
               break;
            case "anqi":
               AnqiResManager.parseRes(_loc3_);
               break;
            case "equipmenplayconfig":
               EquipMosaic.parseRes(_loc3_);
               break;
            case "city":
               CityResManager.parseRes(_loc3_);
               break;
            case "tuteng":
               TuTengResManager.parseRes(_loc3_);
               break;
            case "lianti":
               LiantiResManager.parseRes(_loc3_);
               break;
            case "shengWangShop":
               ShengWangGoodManager.parseTransRes(_loc3_);
               break;
            case "dugujiujian":
               DugujiujianManager.parseRes(_loc3_);
               break;
            case "4lingzhen":
               SiLingZhenResManager.parseRes(_loc3_);
               break;
            case "baguazhang":
               BaGuaZhangRESManager.parseRes(_loc3_);
               break;
            case "jiuyangshengong":
               JiuYangShenGongManager.parseRes(_loc3_);
               break;
            case "qihai":
               QihaiManager.parseRes(_loc3_);
               break;
            case "meiren":
               GirlResManager.parseRes(_loc3_);
               break;
            case "lan2":
               Lan2ResManager.parseRes(_loc3_);
         }
      }
   }
}

