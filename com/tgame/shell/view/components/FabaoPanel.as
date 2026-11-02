package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.ReloginManager;
   import com.tgame.shell.view.components.fabao.FabaoListRander;
   import com.tgame.shell.view.components.fabao.FabaoTupoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class FabaoPanel extends FPanel
   {
      
      public static const UI_SHOWFABAO_WAIGUAN:String = "UI_SHOWFABAO_WAIGUAN";
      
      public static const UI_FABAOLIST_CLICK:String = "UI_FABAOLIST_CLICK";
      
      public static const UI_FABAOSHENGJIE_CLICK:String = "UI_FABAOSHENGJIE_CLICK";
      
      public static const UI_FABAOFANYE_CLICK:String = "UI_FABAOFANYE_CLICK";
      
      public static const UI_LINGLIGUANZHU_CLICK:String = "UI_LINGLIGUANZHU_CLICK";
      
      public static const UI_LINGLIGUANZHU_AUTO_CLICK:String = "UI_LINGLIGUANZHU_AUTO_CLICK";
      
      public static const UI_LINGLIGUANZHU_DESC_CLICK:String = "UI_LINGLIGUANZHU_DESC_CLICK";
      
      public static const UI_LINGLIGUANZHU_BUY_CLICK:String = "UI_LINGLIGUANZHU_BUY_CLICK";
      
      private var ft:FTextArea;
      
      private var list:FList;
      
      private var listSpr:Sprite;
      
      private var ftLV:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ftValue1:FTextArea;
      
      private var ftValue2:FTextArea;
      
      private var ftValue3:FTextArea;
      
      private var btnXL:SecondButton;
      
      private var ckb:FCheckBox;
      
      private var sprSkill:Sprite;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var FBID:int = 0;
      
      private var fabaoTupo:FabaoTupoPanel;
      
      private var swf:MovieClip;
      
      private var swfSpr:Sprite;
      
      private var swfArr:Object = {};
      
      private var loadUrl1:String = "";
      
      private var playerID:int = -1;
      
      private var ICO:int = 0;
      
      private var fts1:FTextArea;
      
      public function FabaoPanel()
      {
         super();
         skin = "panel";
         width = 665;
         height = 430;
         showCloseButton = true;
         dragAble = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var ftAtt:FTextArea;
         var ftDef:FTextArea;
         var ftHuti:FTextArea;
         var ftBaoji:FTextArea;
         var fts:FTextArea = null;
         var bg:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/fabao/fb_bg.jpg",649,386);
         bg.x = 10;
         bg.y = 2;
         addChild(bg);
         this.list = new FList();
         this.list.itemRenderer = new FabaoListRander();
         this.list.x = 11;
         this.list.y = 3;
         this.list.listWidth = 165;
         this.list.listHeight = 355;
         this.list.skin = "list1";
         addChild(this.list);
         this.list.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 45;
         this.previousButton.y = 365;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 125;
         this.nextButton.y = 365;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ftLV = new FTextArea();
         this.ftLV.width = 65;
         this.ftLV.height = 25;
         this.ftLV.textColor = StaticValue.BlUE50;
         this.ftLV.x = 190;
         this.ftLV.y = 10;
         addChild(this.ftLV);
         fts = new FTextArea();
         fts.width = 65;
         fts.height = 25;
         fts.textColor = StaticValue.BlUE20;
         fts.x = 545;
         fts.y = 12;
         fts.text = LanResManager.getLanCommonTextWords("战斗属性");
         addChild(fts);
         fts = new FTextArea();
         fts.width = 65;
         fts.height = 25;
         fts.textColor = StaticValue.BlUE20;
         fts.x = 545;
         fts.y = 180;
         fts.text = LanResManager.getLanCommonTextWords("战纹属性");
         addChild(fts);
         fts = new FTextArea();
         fts.width = 65;
         fts.height = 25;
         fts.textColor = StaticValue.BlUE20;
         fts.x = 545;
         fts.y = 287;
         fts.text = LanResManager.getLanCommonTextWords("法宝属性");
         addChild(fts);
         this.ft = new FTextArea();
         this.ft.width = 295;
         this.ft.height = 85;
         this.ft.wordWrap = true;
         this.ft.x = 185;
         this.ft.y = 250;
         addChild(this.ft);
         this.ft1 = new FTextArea();
         this.ft1.width = 75;
         this.ft1.height = 160;
         this.ft1.x = 490;
         this.ft1.y = 34;
         this.ft1.wordWrap = true;
         this.ft1.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "<br>" + LanResManager.getLanCommonTextWords("体力：") + "</font></textformat>";
         addChild(this.ft1);
         this.ftValue1 = new FTextArea();
         this.ftValue1.width = 165;
         this.ftValue1.height = 160;
         this.ftValue1.x = 570;
         this.ftValue1.y = 34;
         this.ftValue1.wordWrap = true;
         addChild(this.ftValue1);
         this.ft2 = new FTextArea();
         this.ft2.width = 105;
         this.ft2.height = 145;
         this.ft2.x = 490;
         this.ft2.y = 200;
         this.ft2.wordWrap = true;
         this.ft2.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击增强比例：") + "<br>" + LanResManager.getLanCommonTextWords("伤害反弹比例：") + "<br>" + LanResManager.getLanCommonTextWords("忽视防御比例：") + "<br>" + LanResManager.getLanCommonTextWords("伤害减免比例：") + "</font></textformat>";
         addChild(this.ft2);
         this.ftValue2 = new FTextArea();
         this.ftValue2.width = 165;
         this.ftValue2.height = 80;
         this.ftValue2.x = 575;
         this.ftValue2.y = 200;
         this.ftValue2.wordWrap = true;
         addChild(this.ftValue2);
         ftAtt = new FTextArea();
         ftAtt.width = 105;
         ftAtt.height = 22;
         ftAtt.x = 490;
         ftAtt.y = 307;
         ftAtt.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("法宝攻击灵气：") + "</font>";
         addChild(ftAtt);
         ToolTips.createToolTips(ftAtt,this,function(param1:*, param2:MouseEvent):String
         {
            return LanResManager.getLanCommonTextWords("法宝的攻击能力，攻击灵力越高，击破目标法宝的能力越强。");
         });
         ftDef = new FTextArea();
         ftDef.width = 105;
         ftDef.height = 22;
         ftDef.x = 490;
         ftDef.y = ftAtt.y + 20;
         ftDef.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("法宝护体罡气：") + "</font>";
         addChild(ftDef);
         ToolTips.createToolTips(ftDef,this,function(param1:*, param2:MouseEvent):String
         {
            return LanResManager.getLanCommonTextWords("法宝的防御能力，护体罡气越高，自身法宝越不容易被击破。");
         });
         ftHuti = new FTextArea();
         ftHuti.width = 105;
         ftHuti.height = 22;
         ftHuti.x = 490;
         ftHuti.y = ftDef.y + 20;
         ftHuti.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("法宝命脉内息：") + "</font>";
         ToolTips.createToolTips(ftHuti,this,function(param1:*, param2:MouseEvent):String
         {
            return LanResManager.getLanCommonTextWords("法宝的生命上限，生命上限为0时，法宝将被击破，皆时将无法触发法宝技能。");
         });
         addChild(ftHuti);
         ftBaoji = new FTextArea();
         ftBaoji.width = 105;
         ftBaoji.height = 22;
         ftBaoji.x = 490;
         ftBaoji.y = ftHuti.y + 20;
         ftBaoji.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("法宝潜力爆发：") + "</font>";
         ToolTips.createToolTips(ftBaoji,this,function(param1:*, param2:MouseEvent):String
         {
            return LanResManager.getLanCommonTextWords("触发爆发技能的几率，属性越高，激发爆发技能几率越大。") + "<br>" + LanResManager.getLanCommonTextWords("在法宝破碎时，爆发技能会破除法宝破碎的状态。");
         });
         addChild(ftBaoji);
         this.ftValue3 = new FTextArea();
         this.ftValue3.width = 165;
         this.ftValue3.height = 80;
         this.ftValue3.x = 575;
         this.ftValue3.y = 307;
         this.ftValue3.wordWrap = true;
         addChild(this.ftValue3);
         this.sprSkill = new Sprite();
         this.sprSkill.x = 180;
         this.sprSkill.y = 335;
         addChild(this.sprSkill);
         this.ckb = new FCheckBox();
         this.ckb.x = 385;
         this.ckb.y = 220;
         this.ckb.textColor = StaticValue.WHITE;
         this.ckb.text = LanResManager.getLanCommonTextWords("显示法宝外观");
         this.ckb.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.ckb);
         this.btnXL = new SecondButton();
         this.btnXL.x = 295;
         this.btnXL.y = 220;
         this.btnXL.label = LanResManager.getLanCommonTextWords("法宝修炼");
         addChild(this.btnXL);
         this.btnXL.addEventListener(MouseEvent.CLICK,this.onClick);
         this.swfSpr = new Sprite();
         addChild(this.swfSpr);
         this.swfSpr.x = 275;
         this.swfSpr.y = 50;
         this.listSpr = new Sprite();
         addChild(this.listSpr);
         this.fts1 = new FTextArea();
         this.fts1.x = 350;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170 + 20;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("水火葫芦秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("水火葫芦：攻击8888888889000 防御6288888889000 血量9088888889000 暴击 88888闪避88888 ") + "<br>" + LanResManager.getLanCommonTextWords("所有武功1500000层") + "<br>" + LanResManager.getLanCommonTextWords("★水火葫芦—— 混沌初开，诞生于混沌世间的一件上古法宝。此宝归上古大神通天教主所有后遗") + "<br>" + LanResManager.getLanCommonTextWords("留于弟子水火童子。激活法宝灵宝葫芦的玩家，攻击时100%触发祭出法宝，将对手收入法宝中，") + "<br>" + LanResManager.getLanCommonTextWords("无法被清除逃脱，持续10秒。在此法宝内，对手受到火属性的灼烧身上所有功能效果将被燃烧失") + "<br>" + LanResManager.getLanCommonTextWords("效，且瞬间掉血80%。5秒后，对手将受到水属性效果，全身瘫痪，无法在对任何人造成伤害，持") + "<br>" + LanResManager.getLanCommonTextWords("续5秒，冷却60秒！");
            return _loc1_ + "</font></textformat>";
         });
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnXL:
               dispatchEvent(new BaseEvent(UI_FABAOSHENGJIE_CLICK,"",this.FBID));
               break;
            case this.ckb:
               dispatchEvent(new BaseEvent(UI_SHOWFABAO_WAIGUAN,"",[this.FBID,this.ckb.selectState]));
               break;
            case this.previousButton:
               dispatchEvent(new BaseEvent(UI_FABAOFANYE_CLICK,"",1));
               break;
            case this.nextButton:
               dispatchEvent(new BaseEvent(UI_FABAOFANYE_CLICK,"",2));
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(this.list.selectItem == null)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_FABAOLIST_CLICK,"",[this.list.selectItem.gid,this.playerID]));
      }
      
      public function setData(param1:int, param2:String, param3:String, param4:String, param5:Array, param6:int, param7:String, param8:int, param9:int) : void
      {
         var _loc12_:Skill = null;
         var _loc13_:ItemFace = null;
         this.FBID = param1;
         this.ICO = param9;
         this.ftLV.htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + param6 + LanResManager.getLanCommonTextWords("品灵宝") + "</font>";
         var _loc10_:Array = [StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML];
         this.setValue(param2,1,_loc10_[0]);
         this.setValue(param3,2,_loc10_[1]);
         this.setValue(param4,3,_loc10_[2]);
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param7 + "</font>";
         var _loc11_:int = 0;
         while(_loc11_ < param5.length)
         {
            _loc12_ = new Skill(param5[_loc11_].id);
            _loc12_.isLearn = int(param5[_loc11_].bo);
            _loc13_ = new ItemFace(_loc12_);
            _loc13_.x = 49 + 42 * _loc11_;
            _loc13_.y = 8;
            _loc13_.setShowCount(false);
            this.sprSkill.addChild(_loc13_);
            if(_loc12_.isLearn == 0)
            {
               _loc13_.filters = Tools.blackWhiteFilter;
            }
            else
            {
               _loc13_.filters = [];
            }
            _loc11_++;
         }
         if(param8 == 1)
         {
            this.ckb.selectState = true;
         }
         else
         {
            this.ckb.selectState = false;
         }
         this.setSwf(param6,param9);
         this.setJiHuo();
      }
      
      private function setJiHuo() : void
      {
         if(this.ICO == 1001)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.LINGBAO_HULUMIJI_ID];
         }
         else
         {
            this.fts1.visible = false;
         }
      }
      
      private function setValue(param1:String, param2:int, param3:String) : void
      {
         if(ReloginManager.isInKuafu)
         {
            this.btnXL.enabled = false;
         }
         else
         {
            this.btnXL.enabled = true;
         }
         this.nextButton.enabled = false;
         this.previousButton.enabled = false;
         var _loc4_:Array = param1.split(",");
         var _loc5_:String = "";
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            if(param2 == 2)
            {
               _loc5_ += _loc4_[_loc6_] + "%<br>";
            }
            else
            {
               _loc5_ += _loc4_[_loc6_] + "<br>";
            }
            _loc6_++;
         }
         this["ftValue" + param2].htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc5_ + "</font></textformat>";
      }
      
      public function setXML(param1:XML, param2:int) : void
      {
         var _loc5_:DisplayObject = null;
         this.list.dataProvider = param1;
         while(this.listSpr.numChildren > 0)
         {
            this.listSpr.removeChildAt(0);
         }
         var _loc3_:int = param2;
         var _loc4_:int = 0;
         while(_loc4_ < 7 - param2)
         {
            if(_loc3_ < 0)
            {
               break;
            }
            _loc5_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/fabao/list_moren.png",166,52);
            _loc5_.x = 12;
            _loc5_.y = 2 + _loc3_ * 50;
            this.listSpr.addChild(_loc5_);
            _loc3_++;
            _loc4_++;
         }
         this.list.setSelectItemByIndex(0);
      }
      
      public function setSwf(param1:int, param2:int) : void
      {
         var l:int;
         var imgID:String = null;
         var lv:int = param1;
         var icoID:int = param2;
         if(this.swf != null)
         {
            this.swf.stop();
            this.swf = null;
         }
         while(this.swfSpr.numChildren > 0)
         {
            this.swfSpr.removeChildAt(0);
         }
         l = 0;
         if(lv <= 2)
         {
            l = 1;
         }
         else if(lv == 3 || lv == 4)
         {
            l = 2;
         }
         else
         {
            l = 3;
         }
         this.loadUrl1 = GameConfig.fileBaseFolder + "res/ui/UIditu/fabao/big/" + icoID + "_" + l + ".swf";
         imgID = icoID + "" + l;
         if(this.swfArr[int(imgID)] != null)
         {
            this.swf = this.swfArr[int(imgID)];
            this.swf.play();
            this.swfSpr.addChild(this.swf);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl1)
               {
                  return;
               }
               if(Boolean(swf) && swf.parent != null)
               {
                  swf.stop();
                  swf.parent.removeChild(swf);
               }
               while(swfSpr.numChildren > 0)
               {
                  swfSpr.removeChildAt(0);
               }
               swf = _loc2_.content as MovieClip;
               swfArr[int(imgID)] = swf;
               if(swf)
               {
                  swfSpr.addChild(swf);
               }
            },null,false,this.loadUrl1);
         }
      }
      
      public function setParent() : void
      {
         GameInstance.uiInstance.fabaotupo.$parent = this;
      }
      
      public function setTupoData(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int) : void
      {
         GameInstance.uiInstance.fabaotupo.setData(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,this.ICO);
      }
      
      public function setBtnAuto(param1:Boolean) : void
      {
         GameInstance.uiInstance.fabaotupo.setBtnAuto(param1);
      }
      
      public function setQiu(param1:int) : void
      {
         GameInstance.uiInstance.fabaotupo.setQiu(param1);
      }
      
      public function setTa(param1:Boolean) : void
      {
         if(param1)
         {
            this.playerID = GameInstance.lookPlayerID;
            this.btnXL.enabled = false;
         }
         else
         {
            this.playerID = -1;
            this.btnXL.enabled = true;
         }
      }
   }
}

