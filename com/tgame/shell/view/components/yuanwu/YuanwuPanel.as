package com.tgame.shell.view.components.yuanwu
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.asQuery.$;
   import com.fireice.movie.BitmapMovie;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.staticdata.ItemMenuStatus;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.systemculture.TipCanvas;
   import com.tgame.shell.view.components.utils.TipManager;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.display.Container;
   import game.display.Image;
   import game.display.Label;
   import game.display.RadioButton;
   import game.display.RadioButtonGroup;
   import game.display.SimpleButton;
   import game.skin.YuanWuSkin;
   import game.utils.SkinTools;
   
   public class YuanwuPanel extends BasePanel
   {
      
      public static const ShowPeiyang:String = "ShowPeiyang";
      
      public static const YUANWU_XINXI:String = "YUANWU_XINXI";
      
      public static const YUANWU_ZHUANGBEIJIESHAO_PANEL:String = "YUANWU_ZHUANGBEIJIESHAO_PANEL";
      
      public static const YUANWU_TARGET_XINXI:String = "YUANWU_TARGET_XINXI";
      
      public static const YUANWU_TUOXIA:String = "YUANWU_TUOXIA";
      
      public static const YUANWU_ZHANSHI:String = "YUANWU_ZHANSHI";
      
      public static const YUANWU_HEXINTISHENG:String = "YUANWU_HEXINTISHENG";
      
      private var zhenyang:YuanwupeiyangPanel;
      
      private var guanbi:SimpleButton;
      
      private var skillLabel:Label;
      
      private var skillLabe2:Label;
      
      private var skillLabe3:Label;
      
      private var hexinLv:Label;
      
      private var juexingXiaoguo:Label;
      
      private var zanweikaifang:Image;
      
      private var shuxing1:Label;
      
      private var shuxing2:Label;
      
      private var shuxing3:Label;
      
      private var shuxing4:Label;
      
      private var shuxing5:Label;
      
      private var shuxing6:Label;
      
      private var shuxing7:Label;
      
      private var shuxing8:Label;
      
      private var jineng1:Label;
      
      private var jineng2:Label;
      
      private var jineng3:Label;
      
      private var jineng4:Label;
      
      private var jineng5:Label;
      
      private var hexinDJ:Label;
      
      private var juexingxiaoguo:Label;
      
      private var tishengbtn:SimpleButton;
      
      private var zhuangbeiJieshaoBtn:SimpleButton;
      
      private var wenhao1:SimpleButton;
      
      private var wenhao2:SimpleButton;
      
      private var tishengBtn:SimpleButton;
      
      private var jindutiao:Image;
      
      private var ditu1:Image;
      
      private var ditu2:Image;
      
      private var ditu3:Image;
      
      private var ditu4:Image;
      
      private var ditu5:Image;
      
      private var ditu6:Image;
      
      private var ditu7:Image;
      
      private var ditu8:Image;
      
      private var ditu9:Image;
      
      private var ditu10:Image;
      
      private var ditu11:Image;
      
      private var ditu12:Image;
      
      private var ditu13:Image;
      
      private var ditu14:Image;
      
      private var ditu15:Image;
      
      private var ditu16:Image;
      
      private var ditu17:Image;
      
      private var ditu18:Image;
      
      private var ditu19:Image;
      
      private var ditu20:Image;
      
      private var ditu21:Image;
      
      private var ditu22:Image;
      
      private var ditu23:Image;
      
      public var xuanzebtn:RadioButtonGroup;
      
      private var btnQidai:RadioButton;
      
      private var btn2:RadioButton;
      
      private var btn1:RadioButton;
      
      private var btn3:RadioButton;
      
      private var btn4:RadioButton;
      
      private var btn5:RadioButton;
      
      private var btn6:RadioButton;
      
      private var btn7:RadioButton;
      
      private var btn8:RadioButton;
      
      private var btn9:RadioButton;
      
      private var btn10:RadioButton;
      
      private var btn11:RadioButton;
      
      private var btn12:RadioButton;
      
      private var btn13:RadioButton;
      
      private var btn14:RadioButton;
      
      private var btn15:RadioButton;
      
      private var btn16:RadioButton;
      
      private var btn17:RadioButton;
      
      private var btn18:RadioButton;
      
      private var btn19:RadioButton;
      
      private var btn20:RadioButton;
      
      private var btn21:RadioButton;
      
      private var btn22:RadioButton;
      
      private var btn23:RadioButton;
      
      private var arrGoods:Array;
      
      private var _container:Container;
      
      private var color:ColorBar;
      
      private var _menu:Menu;
      
      private var _menuGoods:ItemFace;
      
      private var yuanhuaMovie:BitmapMovie;
      
      private var uiYeshu:int;
      
      public var _isPlayer:Boolean = true;
      
      private var zhanshiId:int = 1;
      
      private var zhanshiBtn:SimpleButton;
      
      private var hexinItem:ItemFace;
      
      private var skillItem:ItemFace;
      
      private var _container2:Container;
      
      private var str1:String;
      
      private var btnZuo:SimpleButton;
      
      private var btnYou:SimpleButton;
      
      private var boxContainer:Sprite;
      
      private var hexinGoodsIdArr:Array = ["",399317,399853,400537,401116,401628,402179,402927];
      
      private var typecount:int = 6;
      
      private var arrPoint:Array = [{},{
         "8051":"398,254",
         "8052":"175,169",
         "8053":"327,104"
      },{
         "8054":"315,94",
         "8055":"167,196",
         "8056":"366,267"
      },{
         "8057":"275,97",
         "8058":"374,256",
         "8059":"169,146"
      },{
         "8060":"176,158",
         "8061":"302,82",
         "8062":"423,255"
      },{
         "8063":"465,157",
         "8064":"385,269",
         "8065":"178,112"
      },{
         "8066":"470,223",
         "8067":"405,91",
         "8068":"164,264"
      },{
         "8069":"213,257",
         "8070":"343,86",
         "8071":"470,189"
      },{
         "10622":"289,274",
         "10624":"170,166",
         "10623":"459,113"
      },{
         "10625":"317,97",
         "10626":"427,250",
         "10627":"168,169"
      },{
         "10628":"471,164",
         "10629":"253,84",
         "10630":"208,273"
      },{
         "10631":"196,230",
         "10632":"382,99",
         "10633":"469,175"
      },{
         "10634":"465,266",
         "10635":"469,93",
         "10636":"170,192"
      },{
         "10637":"452,272",
         "10638":"456,93",
         "10639":"171,152"
      },{
         "10640":"240,106",
         "10641":"460,209",
         "10642":"336,273"
      },{
         "10643":"454,262",
         "10644":"468,111",
         "10645":"182,137"
      },{
         "10646":"461,226",
         "10647":"284,111",
         "10648":"331,277"
      },{
         "10649":"454,249",
         "10650":"448,87",
         "10651":"169,238"
      },{
         "10652":"478,169",
         "10653":"193,269",
         "10654":"457,90"
      },{
         "10655":"304,269",
         "10656":"164,191",
         "10657":"455,99"
      },{
         "10658":"446,89",
         "10659":"174,132",
         "10660":"472,231"
      },{
         "10661":"460,132",
         "10662":"199,256",
         "10663":"294,93"
      },{
         "10664":"278,93",
         "10665":"180,182",
         "10666":"319,272"
      },{
         "10667":"301,100",
         "10668":"319,272",
         "10669":"180,182"
      }];
      
      private var currYe:int = 1;
      
      private var radioBtnNum:int;
      
      private var obj:Object = {
         "jian":1,
         "qiang":2,
         "fu":3,
         "dao":4,
         "ji":5,
         "lun":6,
         "chui":7,
         "dao2":8,
         "dao3":9,
         "lian":10,
         "dao4":11,
         "shan":12,
         "fu2":13,
         "zhua":14,
         "dunpai":15,
         "huoyunjian":16,
         "qishayeyingyi":17,
         "tiandaoxingyuequan":18,
         "jueyinglushenren":19,
         "liudaolunhuijing":20,
         "huanglonghunhaojiao":21,
         "anlingmoyanzhang":22,
         "youmingliehunfu":23
      };
      
      private var _zhaoshiPanel1:XuanyuanhuanyuejianPanel;
      
      public function YuanwuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YuanWuSkin.skin,"yuanwu");
         this.addEventListener(Event.ADDED_TO_STAGE,this.add);
         this.boxContainer = new Sprite();
         this.boxContainer.mouseEnabled = false;
         this.boxContainer.mouseChildren = false;
         addChild(this.boxContainer);
      }
      
      protected function add(param1:Event) : void
      {
      }
      
      public function setData(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:Skill = null;
         while(this._container.numChildren > 0)
         {
            this._container.removeChildAt(0);
         }
         while(this._container2.numChildren > 0)
         {
            this._container2.removeChildAt(0);
         }
         if(Boolean(this.hexinItem) && Boolean(this.hexinItem.parent))
         {
            this.hexinItem.parent.removeChild(this.hexinItem);
         }
         $("^juexing[0-6]",this,true).attr("visible",false);
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            this["shuxing" + String(_loc2_ + 1)].text = "" + param1.zongShuxing[_loc2_];
            _loc2_++;
         }
         this.juexingxiaoguo.text = param1.juexingStr;
         this.arrGoods = param1.arr;
         this.uiYeshu = param1.yeshu;
         this.xuanzebtn.selection = this["btn" + this.uiYeshu];
         _loc2_ = 0;
         while(_loc2_ < this.arrGoods.length)
         {
            _loc3_ = new Goods(this.arrGoods[_loc2_][0]);
            _loc3_.res.position = this.arrGoods[_loc2_][1];
            _loc3_.position = this.arrGoods[_loc2_][2];
            _loc3_.roleID = this.arrGoods[_loc2_][3];
            _loc4_ = new ItemFace(_loc3_);
            _loc5_ = this.arrPoint[this.uiYeshu];
            _loc6_ = _loc5_[_loc3_.res.position + ""];
            _loc7_ = _loc6_.split(",");
            _loc4_.x = int(_loc7_[0]);
            _loc4_.y = int(_loc7_[1]);
            this._container.addChild(_loc4_);
            _loc2_++;
         }
         this.color.setValue(param1.juexingMin,param1.juexingMax);
         $("juexing" + String(param1.juexingLv),this,true).attr("visible",true);
         this.uiInit();
         this.hexinItem = new ItemFace(new Goods(this.hexinGoodsIdArr[this.uiYeshu]));
         addChild(this.hexinItem);
         this.hexinItem.x = 602;
         this.hexinItem.y = 102;
         this.hexinDJ.text = (this.hexinItem.getBaseItem() as Goods).res.name + "[" + param1.hexinDJ + "级]";
         this.dituVisbData();
         _loc2_ = 0;
         while(_loc2_ < param1.arrSkill.length)
         {
            _loc8_ = new Skill(param1.arrSkill[_loc2_][0]);
            _loc8_.isLearn = 1;
            this.skillItem = new ItemFace(_loc8_);
            this.skillItem.setShowCount(false);
            this._container2.addChild(this.skillItem);
            this.skillItem.y = _loc2_ * 44;
            switch(_loc2_)
            {
               case 0:
                  this.jineng1.htmlText = param1.hexinDJ >= param1.arrSkill[0][1] ? "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc8_.res.name + "</font>" : "<font color=\'" + StaticValue.RED_HTML + "\'>" + "核心" + param1.arrSkill[0][1] + "级后解锁" + "</font>";
                  if(param1.hexinDJ >= param1.arrSkill[0][1])
                  {
                     this.skillItem.filters = [];
                  }
                  else
                  {
                     this.skillItem.filters = Tools.blackWhiteFilter;
                  }
                  break;
               case 1:
                  this.jineng2.htmlText = param1.hexinDJ >= param1.arrSkill[1][1] ? "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc8_.res.name + "</font>" : "<font color=\'" + StaticValue.RED_HTML + "\'>" + "核心" + param1.arrSkill[1][1] + "级后解锁" + "</font>";
                  if(param1.vip_level >= 8 && param1.hexinDJ >= param1.arrSkill[1][1])
                  {
                     this.skillItem.filters = [];
                  }
                  else
                  {
                     this.skillItem.filters = Tools.blackWhiteFilter;
                  }
                  break;
               case 2:
                  this.jineng3.htmlText = param1.hexinDJ >= param1.arrSkill[2][1] ? "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc8_.res.name + "</font>" : "<font color=\'" + StaticValue.RED_HTML + "\'>" + "核心" + param1.arrSkill[2][1] + "级后解锁" + "</font>";
                  if(param1.vip_level >= 10 && param1.hexinDJ >= param1.arrSkill[2][1])
                  {
                     this.skillItem.filters = [];
                  }
                  else
                  {
                     this.skillItem.filters = Tools.blackWhiteFilter;
                  }
            }
            _loc2_++;
         }
      }
      
      private function dituVisbData() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ <= this.typecount)
         {
            this["ditu" + _loc1_].visible = this.uiYeshu == _loc1_;
            _loc1_++;
         }
         switch(this.uiYeshu)
         {
            case 1:
               this.str1 = "1.3S之内攻击敌对玩家或者被攻击会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，获得巨大力量增幅。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 2:
               this.str1 = "1.3S之内每闪避一次敌方玩家攻击会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间内不受到任何伤害。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 3:
               this.str1 = "1.3S之内每对敌方玩家造成暴击伤害会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间必定暴击。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 4:
               this.str1 = "1.3S之内每闪避一次敌方玩家攻击会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间内受到攻击会根据自身闪避值反弹伤害。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 5:
               this.str1 = "1.3S之内攻击敌对玩家或者被攻击会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，获得巨大力量增幅。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 6:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，获得巨大力量增幅。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 7:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 8:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 9:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 10:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 11:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 12:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 13:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 14:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 15:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 16:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 17:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 18:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 19:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 20:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 21:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 22:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
               break;
            case 23:
               this.str1 = "1.3S之内攻击敌对玩家会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，持续期间，受到的伤害按一定比例转化为治疗效果。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
         }
      }
      
      public function set isPlayer(param1:Boolean) : void
      {
         this._isPlayer = param1;
         if(!param1)
         {
            this._container.mouseEnabled = false;
            this.tishengbtn.enabled = false;
         }
      }
      
      public function setZhuangbei(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         if(Fun.isVisible(this))
         {
            while(this._container.numChildren > 0)
            {
               this._container.removeChildAt(0);
            }
            $("^juexing[0-6]",this,true).attr("visible",false);
            this.arrGoods = param1.arr;
            this.uiYeshu = param1.yeshu;
            _loc2_ = 1;
            while(_loc2_ <= this.typecount)
            {
               this["ditu" + _loc2_].visible = this.uiYeshu == _loc2_;
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < this.arrGoods.length)
            {
               _loc3_ = new Goods(this.arrGoods[_loc2_][0]);
               _loc3_.res.position = this.arrGoods[_loc2_][1];
               _loc3_.position = this.arrGoods[_loc2_][2];
               _loc3_.roleID = this.arrGoods[_loc2_][3];
               _loc4_ = new ItemFace(_loc3_);
               _loc5_ = this.arrPoint[this.uiYeshu];
               _loc6_ = _loc5_[_loc3_.res.position + ""];
               _loc7_ = _loc6_.split(",");
               _loc4_.x = int(_loc7_[0]);
               _loc4_.y = int(_loc7_[1]);
               this._container.addChild(_loc4_);
               this.xuanzebtn.selection = this["btn" + String(param1.yeshu)];
               _loc2_++;
            }
            this.uiInit();
            _loc2_ = 0;
            while(_loc2_ < 5)
            {
               this["shuxing" + String(_loc2_ + 1)].text = "" + param1.zongShuxing[_loc2_];
               _loc2_++;
            }
            $("juexing" + String(param1.juexingType),this,true).attr("visible",true);
            this.juexingxiaoguo.text = param1.juexingStr;
         }
      }
      
      override protected function createVariableReference() : void
      {
         var tipCanvas:TipCanvas = null;
         var str2:String = null;
         this.color = new ColorBar(5,268,9,true,true);
         this.color.x = 275;
         this.color.y = 413;
         addChild(this.color);
         this.zhuangbeiJieshaoBtn = getChildByName("ywzbjieshao") as SimpleButton;
         this.zhanshiBtn = getChildByName("ywzbzhanshi") as SimpleButton;
         this.zhanshiBtn.visible = false;
         this.zhuangbeiJieshaoBtn.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.zhanshiBtn.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this.shuxing1 = getChildByName("shuxing5") as Label;
         this.shuxing2 = getChildByName("shuxing2") as Label;
         this.shuxing3 = getChildByName("shuxing3") as Label;
         this.shuxing4 = getChildByName("shuxing4") as Label;
         this.shuxing5 = getChildByName("shuxing1") as Label;
         this.shuxing6 = getChildByName("shuxing6") as Label;
         this.shuxing7 = getChildByName("shuxing7") as Label;
         this.shuxing8 = getChildByName("shuxing8") as Label;
         this.jineng1 = getChildByName("jineng1") as Label;
         this.jineng2 = getChildByName("jineng2") as Label;
         this.jineng3 = getChildByName("jineng3") as Label;
         this.jineng4 = getChildByName("jineng4") as Label;
         this.jineng5 = getChildByName("jineng5") as Label;
         this.hexinDJ = getChildByName("hexinDJ") as Label;
         this.juexingxiaoguo = getChildByName("juexingxiaoguo") as Label;
         this.jindutiao = getChildByName("JXjindutiao") as Image;
         this.ditu1 = getChildByName("huanyuejiantu") as Image;
         this.ditu2 = getChildByName("xuanmingqiangtu") as Image;
         this.ditu3 = getChildByName("fenghuangchiyanfutupian") as Image;
         this.ditu4 = getChildByName("luohouxiongmodaotu") as Image;
         this.ditu5 = getChildByName("xingyunleiliejitu") as Image;
         this.ditu6 = getChildByName("cangyanhuankongluntu") as Image;
         this.ditu7 = getChildByName("potianmiedichuitu") as Image;
         this.jindutiao.visible = false;
         $("^juexing[0-6]",this,true).attr("visible",false);
         this.xuanzebtn = getChildByName("xuanzeAN") as RadioButtonGroup;
         this.btn1 = this.xuanzebtn.getChildByName("jian") as RadioButton;
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.btn2 = this.xuanzebtn.getChildByName("qiang") as RadioButton;
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.btn3 = this.xuanzebtn.getChildByName("fu") as RadioButton;
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.btn4 = this.xuanzebtn.getChildByName("dao") as RadioButton;
         this.btn4.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.btn5 = this.xuanzebtn.getChildByName("ji") as RadioButton;
         this.btn5.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.btn6 = this.xuanzebtn.getChildByName("lun") as RadioButton;
         this.btn6.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.btn7 = this.xuanzebtn.getChildByName("chui") as RadioButton;
         this.btn7.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.xuanzebtn.selection = this.btn1;
         this._container = new Container();
         addChild(this._container);
         this._container2 = new Container();
         this._container2.x = 543;
         this._container2.y = 195;
         addChild(this._container2);
         if(this._isPlayer)
         {
            this._container.addEventListener(MouseEvent.CLICK,this.onClickGoods);
         }
         this.wenhao1 = getChildByName("wenhaotubiao1") as SimpleButton;
         this.wenhao2 = getChildByName("wenhaotubiao2") as SimpleButton;
         this.tishengbtn = getChildByName("tsanniu") as SimpleButton;
         this.tishengbtn.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.str1 = "1.3S之内攻击敌对玩家或者被攻击会增加元武觉醒进度。" + "\n" + "2.觉醒进度条达到100%以后，玩家会进入觉醒状态，获得巨大力量增幅。" + "\n" + "3.觉醒的威力会根据3个元武装备的品质决定。只有当同时佩戴同一品质的3个元武装备后，才会获得对应品质的觉醒技能。" + "\n" + "4.当3个装备品质不同时，获得的觉醒技能为3个装备中最差品质对应的技能。";
         tipCanvas = new TipCanvas(this.str1,200);
         TipManager.regObj2HasTips(this.wenhao2,null,false,function(param1:DisplayObject):TipCanvas
         {
            tipCanvas.htmlText = str1;
            return tipCanvas;
         });
         str2 = "1.元武核心共有10级，玩家可以点击提升按钮打开提升面板，消耗对应道具提升元武等级。" + "\n" + "2.每个元武核心都有3个元武技能。元武核心的等级提升，元武技能的等级也会同时提升。" + "\n" + "3.VIP8玩家可激活元武核心第二个技能，VIP10级玩家可激活元武核心第三个技能。";
         tipCanvas = new TipCanvas(str2,200);
         TipManager.regObj2HasTips(this.wenhao1,null,false,function(param1:DisplayObject):TipCanvas
         {
            tipCanvas.htmlText = str2;
            return tipCanvas;
         });
         this.jineng1.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "核心2级后解锁" + "</font>";
         this.jineng2.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "核心4级后解锁" + "</font>";
         this.jineng3.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "核心6级后解锁" + "</font>";
         this.jineng4.htmlText = "VIP8级以上专属";
         this.jineng5.htmlText = "VIP10级以上专属";
         this.btnZuo = getChildByName("yuanzuofanyeanniu") as SimpleButton;
         this.btnZuo.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.btnYou = getChildByName("yuanyoufanyeanniu") as SimpleButton;
         this.btnYou.addEventListener(MouseEvent.CLICK,this.clickHandler);
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         this.radioBtnNum = this.xuanzebtn.numChildren;
         switch(param1.target)
         {
            case this.btn1:
            case this.btn2:
            case this.btn3:
            case this.btn4:
            case this.btn5:
            case this.btn6:
            case this.btn7:
            case this.btn8:
            case this.btn9:
            case this.btn10:
            case this.btn11:
            case this.btn12:
            case this.btn13:
            case this.btn14:
            case this.btn15:
            case this.btn16:
            case this.btn17:
            case this.btn18:
            case this.btn19:
            case this.btn20:
            case this.btn21:
            case this.btn22:
            case this.btn23:
               this.zhanshiId = this.obj[param1.target.name];
               if(this._isPlayer)
               {
                  dispatchEvent(new BaseEvent(YUANWU_XINXI,"",this.zhanshiId));
               }
               else
               {
                  dispatchEvent(new BaseEvent(YUANWU_TARGET_XINXI,"",this.zhanshiId));
               }
               break;
            case this.tishengbtn:
               if(this._isPlayer)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_YUANWUHEXIN_PANEL,this.uiYeshu);
               }
               break;
            case this.zhuangbeiJieshaoBtn:
               dispatchEvent(new BaseEvent(YUANWU_ZHUANGBEIJIESHAO_PANEL,"",1));
               break;
            case this.zhanshiBtn:
               dispatchEvent(new BaseEvent(YUANWU_ZHANSHI,"",[this.uiYeshu,1]));
               break;
            case this.btnZuo:
               if(!this.btnZuo.enabled)
               {
                  return;
               }
               if(this.currYe - 1 > 0)
               {
                  this.setFunYeByIndex(--this.currYe);
               }
               this.btnZuo.enabled = this.currYe - 1 > 0 ? true : false;
               this.btnYou.enabled = (this.currYe + 1) * 16 < this.radioBtnNum + 16 ? true : false;
               break;
            case this.btnYou:
               if(!this.btnYou.enabled)
               {
                  return;
               }
               if((this.currYe + 1) * 16 < this.radioBtnNum + 16)
               {
                  this.setFunYeByIndex(++this.currYe);
               }
               this.btnZuo.enabled = this.currYe - 1 > 0 ? true : false;
               this.btnYou.enabled = (this.currYe + 1) * 16 < this.radioBtnNum + 16 ? true : false;
         }
      }
      
      private function setFunYeByIndex(param1:int) : void
      {
         var _loc2_:int = (param1 - 1) * 16;
         var _loc3_:int = param1 * 16;
         var _loc4_:int = 1;
         while(_loc4_ < this.radioBtnNum)
         {
            if(_loc4_ + 1 > _loc2_ && _loc4_ <= _loc3_)
            {
               this["btn" + _loc4_].visible = true;
            }
            else
            {
               this["btn" + _loc4_].visible = false;
            }
            _loc4_++;
         }
      }
      
      private function uiInit() : void
      {
         var arrPoint:Array;
         this.removeContainerBoxChildren();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            boxContainer.addChild(_loc2_.content as MovieClip);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/yuanwu/effect/1/" + this.uiYeshu + ".swf");
         arrPoint = [new Point(0,0),new Point(139,44),new Point(145,-11),new Point(140,46),new Point(125,29),new Point(138,42),new Point(140,43),new Point(140,45),new Point(140,45),new Point(102,-39),new Point(148,50),new Point(148,50),new Point(78,-65),new Point(147,53),new Point(147,53),new Point(147,53),new Point(141,43),new Point(148,50),new Point(148,50),new Point(148,50),new Point(148,50),new Point(139,42),new Point(139,42),new Point(139,42)];
         this.boxContainer.x = arrPoint[this.uiYeshu].x;
         this.boxContainer.y = arrPoint[this.uiYeshu].y;
         $("ywzbjieshao ywzbzhanshi",this,true).setIndexTop();
      }
      
      private function onClickGoods(param1:MouseEvent) : void
      {
         if(!this._isPlayer)
         {
            return;
         }
         this._menuGoods = param1.target as ItemFace;
         var _loc2_:Array = [{
            "name":ItemMenuStatus.UNLOAD,
            "state":1
         }];
         if(this._menu)
         {
            this._menu.removeEventListener(Menu.MENUITEM_CLICK,this.onMenu);
            this._menu.destroy();
         }
         this._menu = Menu.addMenuItem(_loc2_,param1);
         this._menu.addEventListener(Menu.MENUITEM_CLICK,this.onMenu);
      }
      
      private function onMenu(param1:BaseEvent) : void
      {
         var _loc2_:String = param1.data as String;
         switch(_loc2_)
         {
            case ItemMenuStatus.UNLOAD:
               dispatchEvent(new BaseEvent(YUANWU_TUOXIA,"",this._menuGoods));
         }
      }
      
      public function showZhanshiPanel() : void
      {
         if(!Fun.isVisible(this["zhanshiPanel" + String(this.zhanshiId)]))
         {
            UITools.showPanel(this["zhanshiPanel" + String(this.zhanshiId)]);
         }
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function gotoClose(param1:MouseEvent) : void
      {
         if(Fun.isVisible(this.zhenyang))
         {
            this.zhenyang.closeFunc = this.onClose;
         }
         else
         {
            this.onClose();
         }
      }
      
      public function closeShengjiePanel() : void
      {
         if(this.zhenyang)
         {
            this.zhenyang.onClose(null);
         }
      }
      
      private function get zhanshiPanel1() : XuanyuanhuanyuejianPanel
      {
         if(!this._zhaoshiPanel1)
         {
            this._zhaoshiPanel1 = new XuanyuanhuanyuejianPanel();
            this._zhaoshiPanel1.$parent = this;
         }
         return this._zhaoshiPanel1;
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
   }
}

