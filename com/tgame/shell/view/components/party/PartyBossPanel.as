package com.tgame.shell.view.components.party
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FAlertEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.Party_taskPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class PartyBossPanel extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var _parent1:DisplayObject;
      
      private var fta:FTextArea;
      
      private var selectIndex:int = 0;
      
      private var selectGradeLingPai:FTextArea;
      
      private var listContainerLingPai:FCanvas;
      
      private var selectListLingPai:FList;
      
      private var selectBtnLingPai:FSimpleButton;
      
      private var chk:FCheckBox;
      
      private var selectGradeLingPaiNum:FTextArea;
      
      private var listContainerLingPaiNum:FCanvas;
      
      private var selectListLingPaiNum:FList;
      
      private var selectBtnLingPaiNum:FSimpleButton;
      
      private var lblCondition:FLabel;
      
      private var ftaCondCont:FTextArea;
      
      private var lblGuerdon:FLabel;
      
      private var ftaGuerCont:FTextArea;
      
      private var btnJiLian:SecondButton;
      
      private var btnFuBen:SecondButton;
      
      private var btnJingHun:SecondButton;
      
      private var btnChallenge:SecondButton;
      
      private var goodsArr:Array = [];
      
      private var goodsBg:Sprite;
      
      private var canvas:PartyBossCanvas;
      
      private var BossName:FTextArea;
      
      private var jdcgl:FTextArea;
      
      private var spr:Sprite;
      
      private var jlCopper:FTextArea;
      
      private var ftCopper:FTextArea;
      
      private var ft:FTextArea;
      
      private var _avatar:Bitmap;
      
      public function PartyBossPanel()
      {
         super();
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/party/ui.party.boss.bg.swf");
         addChild(_loc1_);
         this.setUI();
         this._avatar = new Bitmap();
         addChild(this._avatar);
      }
      
      public function setUI() : void
      {
         var cont1:String;
         var cont2:String;
         var shuoming:FTextArea;
         this.ft = new FTextArea();
         this.ft.htmlText = LanResManager.getLanCommonTextWords("帮派铜钱");
         this.ft.textColor = StaticValue.WHITE;
         this.ft.x = 500 - 2;
         this.ft.y = 245;
         addChild(this.ft);
         this.ftCopper = new FTextArea();
         this.ftCopper.htmlText = "1000";
         this.ftCopper.textColor = StaticValue.WHITE;
         this.ftCopper.x = 573;
         this.ftCopper.y = 245;
         addChild(this.ftCopper);
         this.spr = new Sprite();
         this.spr.x = 425;
         this.spr.y = 40;
         addChild(this.spr);
         this.BossName = new FTextArea();
         this.BossName.x = 425;
         this.BossName.textColor = StaticValue.WHITE;
         this.BossName.y = 10;
         this.BossName.htmlText = "";
         this.BossName.width = 200;
         addChild(this.BossName);
         this.ft = new FTextArea();
         this.ft.htmlText = LanResManager.getLanCommonTextWords("祭炼消耗帮派铜钱") + "：";
         this.ft.textColor = StaticValue.WHITE;
         this.ft.x = 425;
         this.ft.y = 30;
         addChild(this.ft);
         this.jlCopper = new FTextArea();
         this.jlCopper.htmlText = "";
         this.jlCopper.textColor = StaticValue.WHITE;
         this.jlCopper.x = 550;
         this.jlCopper.y = 30;
         addChild(this.jlCopper);
         this.ft = new FTextArea();
         this.ft.htmlText = LanResManager.getLanCommonTextWords("祭炼成功率") + "：";
         this.ft.textColor = StaticValue.WHITE;
         this.ft.x = 425;
         this.ft.y = 50 + 12 + 5;
         addChild(this.ft);
         this.jdcgl = new FTextArea();
         this.jdcgl.textColor = StaticValue.WHITE;
         this.jdcgl.x = 540;
         this.jdcgl.y = 50 + 12 + 5;
         this.jdcgl.htmlText = "";
         addChild(this.jdcgl);
         this.selectGradeLingPai = new FTextArea();
         this.listContainerLingPai = new FCanvas();
         this.selectListLingPai = new FList();
         this.selectGradeLingPaiNum = new FTextArea();
         this.listContainerLingPaiNum = new FCanvas();
         this.selectListLingPaiNum = new FList();
         this.goodsBg = new Sprite();
         this.goodsBg.x = 281;
         this.goodsBg.y = 234;
         addChild(this.goodsBg);
         this.canvas = new PartyBossCanvas();
         this.canvas.x = 8;
         this.canvas.y = 8;
         this.canvas.bossList.addEventListener(MouseEvent.CLICK,this.onBossListClick);
         addChild(this.canvas);
         cont1 = "xxxxx<br>" + "xxxxx<br>" + "xxxxx";
         cont2 = "xxxxx";
         this.lblCondition = new FLabel();
         with(this.lblCondition)
         {
            x = 278;
            y = 140;
            width = 100;
            height = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("BOSS特殊技能") + "：";
         }
         addChild(this.lblCondition);
         this.ftaCondCont = new FTextArea();
         with(this.ftaCondCont)
         {
            x = 280 + 20;
            y = 150 + 5;
            width = 300;
            height = 50;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = cont1;
         }
         addChild(this.ftaCondCont);
         this.lblGuerdon = new FLabel();
         with(this.lblGuerdon)
         {
            x = 278;
            y = ftaCondCont.y + ftaCondCont.height - 2;
            width = 100;
            height = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("克制阵法") + "：";
         }
         addChild(this.lblGuerdon);
         this.ftaGuerCont = new FTextArea();
         with(this.ftaGuerCont)
         {
            x = 410;
            y = lblGuerdon.y;
            width = 100;
            height = 18;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = cont2;
         }
         addChild(this.ftaGuerCont);
         shuoming = new FTextArea();
         with(shuoming)
         {
            x = 280 + 10;
            y = lblGuerdon.y + lblGuerdon.height - 2 - 3;
            width = 350;
            height = 18;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("未有相应阵法将只能造成10%伤害，有此阵法将造成双倍伤害");
         }
         addChild(shuoming);
         this.initRightPanel();
         this.initList(203,79,this.selectGradeLingPai,this.listContainerLingPai,this.selectListLingPai,this.selectBtnLingPai,LanResManager.getLanCommonTextWords("帮主令牌"),[{
            "label":LanResManager.getLanCommonTextWords("帮主令牌"),
            "id":0
         },{
            "label":LanResManager.getLanCommonTextWords("青龙令牌"),
            "id":1
         },{
            "label":LanResManager.getLanCommonTextWords("白虎令牌"),
            "id":2
         },{
            "label":LanResManager.getLanCommonTextWords("朱雀令牌"),
            "id":3
         },{
            "label":LanResManager.getLanCommonTextWords("玄武令牌"),
            "id":4
         }],1);
         this.initList(310,79,this.selectGradeLingPaiNum,this.listContainerLingPaiNum,this.selectListLingPaiNum,this.selectBtnLingPaiNum,"1",[{
            "label":1,
            "id":1
         },{
            "label":2,
            "id":2
         },{
            "label":3,
            "id":3
         },{
            "label":4,
            "id":4
         },{
            "label":5,
            "id":5
         },{
            "label":6,
            "id":6
         },{
            "label":7,
            "id":7
         },{
            "label":8,
            "id":8
         },{
            "label":9,
            "id":9
         }],2);
         this.btnJiLian = new SecondButton();
         this.btnJiLian.label = LanResManager.getLanCommonTextWords("BOSS祭练");
         addChild(this.btnJiLian);
         this.btnJiLian.x = 570 - 7;
         this.btnJiLian.y = 83;
         this.btnJiLian.addEventListener(MouseEvent.CLICK,this.onJiLianClick);
         this.btnJiLian.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("祭炼可提升的星级，星级越高，击杀后所获得的奖励越好。") + "</font><br /><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("本功能只有帮主可以使用。") + "</font>";
         this.chk = new FCheckBox();
         this.chk.textColor = StaticValue.WHITE;
         this.chk.x = 425 - 13;
         this.chk.y = 90 + 22;
         this.chk.text = LanResManager.getLanCommonTextWords("消耗令牌提高成功率");
         addChild(this.chk);
         this.chk.selectState = false;
         this.chk.addEventListener(MouseEvent.CLICK,this.onChk);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this._parent1 = this._parent;
      }
      
      public function initRightPanel() : void
      {
         this.btnJingHun = new SecondButton();
         with(this.btnJingHun)
         {
            x = -224 + 384;
            y = 230 + 58;
            label = LanResManager.getLanCommonTextWords("上交精魂");
            addEventListener(MouseEvent.CLICK,onJingHunClick);
         }
         addChild(this.btnJingHun);
         this.btnChallenge = new SecondButton();
         with(this.btnChallenge)
         {
            toolTip = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有帮派官员才可以开启副本，开启副本将消耗100点个人帮派贡献。") + "</font>";
            x = -88 + 384;
            y = 230 + 58;
            label = LanResManager.getLanCommonTextWords("进行挑战");
            addEventListener(MouseEvent.CLICK,onChallengeClick);
         }
         addChild(this.btnChallenge);
         this.btnFuBen = new SecondButton();
         with(this.btnFuBen)
         {
            x = 66 + 384;
            y = 230 + 58;
            label = LanResManager.getLanCommonTextWords("传入副本");
            toolTip = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("需要帮派官员挑战BOSS开启血色城堡后，才能使用本功能传入血色城堡副本中。") + "</font>";
            addEventListener(MouseEvent.CLICK,onFuBenClick);
         }
         addChild(this.btnFuBen);
      }
      
      private function onChk(param1:MouseEvent = null) : void
      {
         var _loc4_:FSimpleButton = null;
         var _loc5_:FSimpleButton = null;
         var _loc2_:int = int(this.jdcgl.text.substr(0,this.jdcgl.text.length - 1));
         var _loc3_:int = int(this.selectGradeLingPaiNum.text);
         if(!this.chk.selectState)
         {
            _loc2_ -= _loc3_ * 5;
            _loc4_ = this.getChildByName("1") as FSimpleButton;
            _loc4_.enabled = false;
            _loc5_ = this.getChildByName("2") as FSimpleButton;
            _loc5_.enabled = false;
         }
         else
         {
            _loc2_ += _loc3_ * 5;
            _loc4_ = this.getChildByName("1") as FSimpleButton;
            _loc4_.enabled = true;
            _loc5_ = this.getChildByName("2") as FSimpleButton;
            _loc5_.enabled = true;
         }
         this.jdcgl.text = _loc2_ + "%";
      }
      
      private function showSelectList(param1:FCanvas) : Function
      {
         var listContainer:FCanvas = param1;
         var fun:Function = function(param1:MouseEvent):void
         {
            listContainer.visible = !listContainer.visible;
            if(listContainer.visible)
            {
               setChildIndex(listContainer,numChildren - 1);
            }
         };
         return fun;
      }
      
      private function onBossListClick(param1:MouseEvent = null) : void
      {
         var _loc3_:int = 0;
         var _loc7_:Bitmap = null;
         var _loc8_:Array = null;
         if(this.canvas.bossList.selectItem == null)
         {
            return;
         }
         this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYBOSS_LIST_CLICK,"",[this.canvas.bossList.selectItem.id]));
         var _loc2_:int = int(this.canvas.bossList.selectItem.grade);
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         _loc3_ = 0;
         while(_loc3_ < 10)
         {
            if(_loc3_ < _loc2_)
            {
               _loc7_ = StaticValue.getBitmapByClassName("itemtip.s2");
            }
            else
            {
               _loc7_ = StaticValue.getBitmapByClassName("itemtip.s1");
            }
            _loc7_.x = _loc3_ * 16;
            _loc7_.y = 8;
            this.spr.addChild(_loc7_);
            _loc3_++;
         }
         this.BossName.htmlText = this.canvas.bossList.selectItem.name;
         this.jlCopper.htmlText = this.canvas.bossList.selectItem.copper;
         var _loc4_:int = int(this.selectGradeLingPaiNum.text);
         var _loc5_:int = int(this.canvas.bossList.selectItem.cgl);
         if(_loc4_ > 0 && this.chk.selectState)
         {
            _loc5_ += 5 * _loc4_;
         }
         this.jdcgl.htmlText = _loc5_ + "%";
         var _loc6_:String = this.canvas.bossList.selectItem.jn;
         if(_loc6_ == "null")
         {
            _loc6_ = "";
         }
         else
         {
            _loc8_ = _loc6_.split("|");
            _loc6_ = "";
            _loc3_ = 0;
            while(_loc3_ < _loc8_.length)
            {
               _loc6_ += _loc8_[_loc3_] + "<br />";
               _loc3_++;
            }
            if(_loc8_.length == 0)
            {
               _loc6_ = "";
            }
         }
         this.ftaCondCont.htmlText = _loc6_;
         this.ftaGuerCont.htmlText = "【" + this.canvas.bossList.selectItem.zf + "】";
         if(this.canvas.bossList.selectItem.grade == 10)
         {
            this.btnJiLian.enabled = false;
         }
         else
         {
            this.btnJiLian.enabled = true;
         }
      }
      
      private function onJiLianClick(param1:MouseEvent) : void
      {
         if(this.canvas.bossList.selectItem == null)
         {
            FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("请选择要祭炼的BOSS！") + "</font></textformat>");
            return;
         }
         var _loc2_:Array = new Array();
         if(this.chk.selectState)
         {
            _loc2_[0] = this.selectGradeLingPai.text;
            switch(_loc2_[0])
            {
               case LanResManager.getLanCommonTextWords("帮主令牌"):
                  _loc2_[0] = 0;
                  break;
               case LanResManager.getLanCommonTextWords("青龙令牌"):
                  _loc2_[0] = 1;
                  break;
               case LanResManager.getLanCommonTextWords("白虎令牌"):
                  _loc2_[0] = 2;
                  break;
               case LanResManager.getLanCommonTextWords("朱雀令牌"):
                  _loc2_[0] = 3;
                  break;
               case LanResManager.getLanCommonTextWords("玄武令牌"):
                  _loc2_[0] = 4;
            }
            _loc2_[1] = this.selectGradeLingPaiNum.text;
         }
         else
         {
            _loc2_[0] = -1;
            _loc2_[1] = 0;
         }
         _loc2_[2] = this.canvas.bossList.selectItem.biaoshi;
         this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYBOSS_JIDIAN_CLICK,"",_loc2_));
      }
      
      private function onListSelect(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectListLingPai:
               if(this.selectListLingPai.selectItem.label != null)
               {
                  this.selectGradeLingPai.text = this.selectListLingPai.selectItem.label;
                  this.listContainerLingPai.visible = false;
                  this.initDataDetails();
               }
               break;
            case this.selectListLingPaiNum:
               if(this.selectListLingPaiNum.selectItem.label != null)
               {
                  this.selectGradeLingPaiNum.text = this.selectListLingPaiNum.selectItem.label;
                  this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYBOSS_CHENGGONGLV_CLICK,"",[this.selectGradeLingPaiNum.text,this.canvas.bossList.selectItem.cgl,this.canvas.bossList.selectItem.id,this.chk.selectState]));
                  this.listContainerLingPaiNum.visible = false;
               }
         }
      }
      
      private function onJingHunClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_PARTYBOSS_JINGHUN_CLICK));
      }
      
      private function onChallengeClick(param1:MouseEvent) : void
      {
         var level:int;
         var e:MouseEvent = param1;
         if(this.canvas.bossList.selectItem == null)
         {
            FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("请选择要挑战的BOSS！") + "</font></textformat>");
            return;
         }
         level = int(this.canvas.bossList.selectItem.grade);
         FAlert.show(LanResManager.getLanCommonTextWords("该帮派BOSS目前强度为：") + level + LanResManager.getLanCommonTextWords("星星级越高，奖励越丰厚最高星级为星确定挑战该帮派？"),LanResManager.getLanCommonTextWords("帮派BOSS"),2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               _parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_PARTYBOSS_CHALLENGE,"",[canvas.bossList.selectItem.biaoshi]));
            }
         },true);
      }
      
      private function onFuBenClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_PARTYBOSS_FUBEN_CLICK));
      }
      
      private function initDataDetails() : void
      {
      }
      
      private function setRightPanel(param1:Array) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = "xxxxx<br/>xxxxxx";
         var _loc4_:String = "xxxx";
         this.ftaCondCont.htmlText = _loc3_;
         this.ftaGuerCont.htmlText = "【" + _loc4_ + "】";
      }
      
      private function initList(param1:int, param2:int, param3:FTextArea, param4:FCanvas, param5:FList, param6:FSimpleButton, param7:String, param8:Array, param9:int = 1) : void
      {
         var offsetX:int = param1;
         var offsetY:int = param2;
         var selectGrade:FTextArea = param3;
         var listContainer:FCanvas = param4;
         var selectList:FList = param5;
         var selectBtn:FSimpleButton = param6;
         var txt2:String = param7;
         var data:Array = param8;
         var type:int = param9;
         with(selectGrade)
         {
            x = 213 + offsetX;
            y = 6 + offsetY;
            width = 130;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = txt2;
         }
         addChild(selectGrade);
         listContainer.skin = "backGroud";
         listContainer.x = 211 + offsetX;
         listContainer.y = 22 + offsetY;
         addChild(listContainer);
         listContainer.visible = false;
         selectBtn = new FSimpleButton();
         selectBtn.skin = "bottomButton";
         addChild(selectBtn);
         selectBtn.enabled = false;
         if(type == 1)
         {
            selectBtn.x = 281 + offsetX;
         }
         else if(type == 2)
         {
            selectBtn.x = 229 + offsetX;
         }
         selectBtn.y = 5 + offsetY;
         selectBtn.addEventListener(MouseEvent.CLICK,this.showSelectList(listContainer));
         selectBtn.name = String(type);
         selectList.skin = "list";
         if(type == 1)
         {
            selectList.listWidth = 78;
         }
         else
         {
            selectList.listWidth = 28;
         }
         selectList.x = 5;
         selectList.y = 2;
         selectList.itemRenderer = new PartyBossLingPaiListRender();
         selectList.dataProvider = data;
         listContainer.addChild(selectList);
         selectList.addEventListener(MouseEvent.CLICK,this.onListSelect);
         listContainer.width = selectList.width + 10;
         listContainer.height = selectList.height + 4;
      }
      
      public function initGoodsList(param1:Array, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:ItemFace = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         while(this.goodsBg.numChildren)
         {
            this.goodsBg.removeChildAt(0);
         }
         if(param1 != null && param1.length > 0)
         {
            _loc3_ = int(param1.length);
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc6_ = _loc5_ % 5;
               _loc7_ = _loc5_ / 5;
               _loc4_ = new ItemFace(param1[_loc5_] as Goods);
               _loc4_.name = _loc5_.toString();
               this.goodsBg.addChild(_loc4_);
               _loc4_.x = _loc6_ * 45 + 2;
               _loc4_.y = _loc7_ * 45 + 2;
               _loc8_ = param1[_loc5_] as Goods;
               if(_loc8_.count <= 0)
               {
                  _loc4_.filters = Tools.blackWhiteFilter;
               }
               else
               {
                  _loc4_.filters = [];
               }
               _loc5_++;
            }
         }
         this.ftCopper.htmlText = String(param2);
      }
      
      public function initBossList(param1:XML, param2:int, param3:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:Bitmap = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc4_:Boolean = false;
         if(this.canvas.bossList.selectItem != null)
         {
            if(this.canvas.bossList.selectItem.xuhao == param3)
            {
               _loc4_ = true;
            }
         }
         this.canvas.setList(param1,_loc4_);
         if(param2 > 0)
         {
            this.chk.enabled = true;
            if(param3 <= 0)
            {
               param3 = 0;
            }
            this.canvas.bossList.setSelectItemByIndex(param3);
            this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYBOSS_LIST_CLICK,"",[this.canvas.bossList.selectItem.id]));
            _loc6_ = int(this.canvas.bossList.selectItem.grade);
            while(this.spr.numChildren > 0)
            {
               this.spr.removeChildAt(0);
            }
            _loc7_ = 0;
            while(_loc7_ < 10)
            {
               if(_loc7_ < _loc6_)
               {
                  _loc9_ = StaticValue.getBitmapByClassName("itemtip.s2");
               }
               else
               {
                  _loc9_ = StaticValue.getBitmapByClassName("itemtip.s1");
               }
               _loc9_.x = _loc7_ * 16;
               _loc9_.y = 8;
               this.spr.addChild(_loc9_);
               _loc7_++;
            }
            this.BossName.htmlText = this.canvas.bossList.selectItem.name;
            this.jlCopper.htmlText = this.canvas.bossList.selectItem.copper;
            _loc8_ = this.canvas.bossList.selectItem.jn;
            if(_loc8_ != "null")
            {
               _loc10_ = _loc8_.split("|");
               _loc8_ = "";
               _loc7_ = 0;
               while(_loc7_ < _loc10_.length)
               {
                  _loc8_ += _loc10_[_loc7_] + "<br />";
                  _loc7_++;
               }
            }
            else
            {
               _loc8_ = "";
            }
            this.ftaCondCont.htmlText = _loc8_;
            this.ftaGuerCont.htmlText = "【" + this.canvas.bossList.selectItem.zf + "】";
         }
         var _loc5_:int = int(this.selectGradeLingPaiNum.text);
         if(this.canvas.bossList.selectItem != null)
         {
            _loc11_ = int(this.canvas.bossList.selectItem.cgl);
            if(_loc5_ > 0 && this.chk.selectState)
            {
               _loc11_ += 5 * _loc5_;
            }
            this.jdcgl.htmlText = _loc11_ + "%";
            if(_loc6_ == 10)
            {
               this.btnJiLian.enabled = false;
            }
            else
            {
               this.btnJiLian.enabled = true;
            }
         }
         if(param2 == 0)
         {
            this.BossName.htmlText = "";
            this.jlCopper.htmlText = "";
            this.ftaCondCont.htmlText = "";
            this.ftaGuerCont.htmlText = "";
            this.jdcgl.htmlText = "";
            this.chk.selectState = false;
            this.chk.enabled = false;
            while(this.spr.numChildren)
            {
               this.spr.removeChildAt(0);
            }
         }
      }
      
      public function setButtonSta(param1:Boolean, param2:int) : void
      {
         if(param2 > 0)
         {
            this.btnChallenge.enabled = true;
         }
         else
         {
            this.btnChallenge.enabled = false;
         }
         if(param1)
         {
            this.btnFuBen.enabled = true;
         }
         else
         {
            this.btnFuBen.enabled = false;
         }
      }
      
      public function setChengGongLv(param1:int) : void
      {
         this.jdcgl.htmlText = param1 + "%";
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:Number = 1;
         if(this._avatar.height != 110)
         {
            _loc2_ = 110 / this._avatar.height;
         }
         var _loc3_:Rectangle = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
         this._avatar.bitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         this._avatar.bitmapData.copyPixels(param1,_loc3_,new Point(0,0));
         var _loc4_:Number = 1;
         if(_loc3_.width > 115)
         {
            _loc4_ = 115 / _loc3_.width;
         }
         this._avatar.scaleX = this._avatar.scaleY = _loc2_ > _loc4_ ? _loc4_ : _loc2_;
         this._avatar.x = 270 + 72 - this._avatar.width / 2;
         this._avatar.y = 73 - this._avatar.height / 2;
      }
   }
}

