package com.tgame.moudels.loadres.model
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.JiuYangShenGong.JiuYangShenGongManager;
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
   import com.tgame.manager.StaticValueManager;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.codemix.ZZip;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LoadRes_ReLoadProxy extends Proxy
   {
      
      public static const NAME:String = "LoadRes_ReLoadProxy";
      
      public function LoadRes_ReLoadProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      public function lan_itemLoadComplete(param1:Event) : void
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
               StaticValueManager.init();
               break;
            case "lan_offset":
               LanResManager.parseLanOffsetRes(_loc2_);
         }
      }
      
      public function xml_itemLoadComplete(param1:Event) : void
      {
         var _loc3_:* = undefined;
         if(!param1.target)
         {
            return;
         }
         var _loc2_:LoadingItem = param1.target as LoadingItem;
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
         }
      }
   }
}

