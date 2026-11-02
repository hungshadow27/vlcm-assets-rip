package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.info.AfkInfo2;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.autoFight.AutoFightMenuListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.*;
   import flash.text.TextFormat;
   
   public class AutoFightPanel extends FPanel
   {
      
      public static const UI_AUTOFIGHT_START:String = "UI_AUTOFIGHT_START";
      
      public static const UI_AUTOFIGHT_STOP:String = "UI_AUTOFIGHT_STOP";
      
      private var VO:AfkInfo2;
      
      private var HPcheck:FCheckBox;
      
      private var MPcheck:FCheckBox;
      
      private var TLcheck:FCheckBox;
      
      private var charEXPcheck:FCheckBox;
      
      private var charZQcheck:FCheckBox;
      
      private var rideEXPcheck:FCheckBox;
      
      private var pickCheck1:FCheckBox;
      
      private var pickCheck2:FCheckBox;
      
      private var pickCheck3:FCheckBox;
      
      private var pickCheck4:FCheckBox;
      
      private var pickCheck5:FCheckBox;
      
      private var pickCheck6:FCheckBox;
      
      private var skillCheck:FCheckBox;
      
      private var skillCheck1:FCheckBox;
      
      private var skillCheck2:FCheckBox;
      
      private var skillCheck3:FCheckBox;
      
      private var skillCheck4:FCheckBox;
      
      private var skillCheck5:FCheckBox;
      
      private var skillCheck6:FCheckBox;
      
      private var skillCheck7:FCheckBox;
      
      private var optionCheck1:FCheckBox;
      
      private var optionCheck2:FCheckBox;
      
      private var optionCheck3:FCheckBox;
      
      private var optionCheck4:FCheckBox;
      
      private var HPvalue:FTextInput;
      
      private var MPvalue:FTextInput;
      
      private var TLvalue:FTextInput;
      
      private var HPRecoverMode:FLabel;
      
      private var MPRecoverMode:FLabel;
      
      private var TLRecoverMode:FLabel;
      
      private var pickMode_party:FLabel;
      
      private var pickMode_level:FLabel;
      
      private var pickMode_quality:FLabel;
      
      private var attackMode_char:FTextArea;
      
      private var attackMode_ride:FTextArea;
      
      private var attatckArea:FTextInput;
      
      private var attackTime:FTextInput;
      
      private var btn1:FSimpleButton;
      
      private var btn2:FSimpleButton;
      
      private var btn3:FSimpleButton;
      
      private var btn4:FSimpleButton;
      
      private var btn5:FSimpleButton;
      
      private var btn6:FSimpleButton;
      
      private var btn7:FSimpleButton;
      
      private var btn8:FSimpleButton;
      
      private var menuContainer1:FCanvas;
      
      private var menuContainer2:FCanvas;
      
      private var menuContainer3:FCanvas;
      
      private var menuContainer4:FCanvas;
      
      private var menuContainer5:FCanvas;
      
      private var menuContainer6:FCanvas;
      
      private var menuContainer7:FCanvas;
      
      private var menuContainer8:FCanvas;
      
      private var scrollBar1:FVScorllBar;
      
      private var scrollBar2:FVScorllBar;
      
      private var scrollBar3:FVScorllBar;
      
      private var scrollBar4:FVScorllBar;
      
      private var scrollBar5:FVScorllBar;
      
      private var scrollBar6:FVScorllBar;
      
      private var scrollBar7:FVScorllBar;
      
      private var scrollBar8:FVScorllBar;
      
      private var menuList1:FList;
      
      private var menuList2:FList;
      
      private var menuList3:FList;
      
      private var menuList4:FList;
      
      private var menuList5:FList;
      
      private var menuList6:FList;
      
      private var menuList7:FList;
      
      private var menuList8:FList;
      
      private var charSkills:Array;
      
      private var rideSkills:Array;
      
      public var startBtn:SecondButton;
      
      public var stopBtn:SecondButton;
      
      public function AutoFightPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 650;
         height = 367;
         titleText = LanResManager.getLanCommonTextWords("智能托管打怪设置");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         var _loc1_:Bitmap = new Bitmap();
         _loc1_.name = "ui.autoLine.ui";
         addChild(_loc1_);
         _loc1_.x = 10;
         _loc1_.y = 0;
         var _loc2_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc2_.push(_loc1_);
         this.DynamicManageImages = _loc2_;
         this.initText();
         this.init();
         this.initMenu();
      }
      
      private function init() : void
      {
         this.HPcheck = new FCheckBox();
         addChild(this.HPcheck);
         this.HPcheck.x = 20;
         this.HPcheck.y = 37;
         this.btn1 = new FSimpleButton();
         with(this.btn1)
         {
            skin = "bottomButton";
            x = 278;
            y = 37;
            addEventListener(MouseEvent.CLICK,onShowMenu);
         }
         addChild(this.btn1);
         this.MPcheck = new FCheckBox();
         addChild(this.MPcheck);
         this.MPcheck.x = 20;
         this.MPcheck.y = 60;
         this.btn2 = new FSimpleButton();
         with(this.btn2)
         {
            skin = "bottomButton";
            x = 278;
            y = 60;
            addEventListener(MouseEvent.CLICK,onShowMenu);
         }
         addChild(this.btn2);
         this.TLcheck = new FCheckBox();
         addChild(this.TLcheck);
         this.TLcheck.x = 20;
         this.TLcheck.y = 84;
         this.btn3 = new FSimpleButton();
         with(this.btn3)
         {
            skin = "bottomButton";
            x = 278;
            y = 84;
            addEventListener(MouseEvent.CLICK,onShowMenu);
         }
         addChild(this.btn3);
         this.charEXPcheck = new FCheckBox();
         addChild(this.charEXPcheck);
         this.charEXPcheck.x = 20;
         this.charEXPcheck.y = 113;
         this.charZQcheck = new FCheckBox();
         addChild(this.charZQcheck);
         this.charZQcheck.x = 20;
         this.charZQcheck.y = 133;
         this.rideEXPcheck = new FCheckBox();
         addChild(this.rideEXPcheck);
         this.rideEXPcheck.x = 20;
         this.rideEXPcheck.y = 153;
         this.pickCheck1 = new FCheckBox();
         addChild(this.pickCheck1);
         this.pickCheck1.x = 20;
         this.pickCheck1.y = 217;
         this.btn4 = new FSimpleButton();
         with(this.btn4)
         {
            skin = "bottomButton";
            x = 137;
            y = 217;
            addEventListener(MouseEvent.CLICK,onShowMenu);
         }
         addChild(this.btn4);
         this.btn5 = new FSimpleButton();
         with(this.btn5)
         {
            skin = "bottomButton";
            x = 219;
            y = 217;
            addEventListener(MouseEvent.CLICK,onShowMenu);
         }
         addChild(this.btn5);
         this.btn6 = new FSimpleButton();
         with(this.btn6)
         {
            skin = "bottomButton";
            x = 301;
            y = 217;
            addEventListener(MouseEvent.CLICK,onShowMenu);
         }
         addChild(this.btn6);
         this.pickCheck2 = new FCheckBox();
         addChild(this.pickCheck2);
         this.pickCheck2.x = 20;
         this.pickCheck2.y = 243;
         this.pickCheck3 = new FCheckBox();
         addChild(this.pickCheck3);
         this.pickCheck3.x = 20;
         this.pickCheck3.y = 263;
         this.pickCheck4 = new FCheckBox();
         addChild(this.pickCheck4);
         this.pickCheck4.x = 138;
         this.pickCheck4.y = 243;
         this.pickCheck5 = new FCheckBox();
         addChild(this.pickCheck5);
         this.pickCheck5.x = 138;
         this.pickCheck5.y = 263;
         this.pickCheck6 = new FCheckBox();
         addChild(this.pickCheck6);
         this.pickCheck6.x = 262;
         this.pickCheck6.y = 243;
         this.btn7 = new FSimpleButton();
         with(this.btn7)
         {
            skin = "bottomButton";
            x = 516 + 20;
            y = 37;
            addEventListener(MouseEvent.CLICK,onShowMenu);
         }
         addChild(this.btn7);
         this.btn8 = new FSimpleButton();
         with(this.btn8)
         {
            skin = "bottomButton";
            x = 516 + 20;
            y = 60;
            addEventListener(MouseEvent.CLICK,onShowMenu);
         }
         addChild(this.btn8);
         this.skillCheck = new FCheckBox();
         addChild(this.skillCheck);
         this.skillCheck.border = true;
         this.skillCheck.textColor = StaticValue.BLUE;
         this.skillCheck.x = 372;
         this.skillCheck.y = 85;
         this.skillCheck.text = LanResManager.getLanCommonTextWords("自动续用以下辅助类武功");
         this.skillCheck.addEventListener(MouseEvent.CLICK,this.onSkillChange);
         this.skillCheck1 = new FCheckBox();
         addChild(this.skillCheck1);
         this.skillCheck1.border = true;
         this.skillCheck1.textColor = StaticValue.BLUE;
         this.skillCheck1.x = 372;
         this.skillCheck1.y = 105;
         this.skillCheck1.text = LanResManager.getLanCommonTextWords("武神临体");
         this.skillCheck2 = new FCheckBox();
         addChild(this.skillCheck2);
         this.skillCheck2.border = true;
         this.skillCheck2.textColor = StaticValue.BLUE;
         this.skillCheck2.x = 462;
         this.skillCheck2.y = 105;
         this.skillCheck2.text = LanResManager.getLanCommonTextWords("战意激昂");
         this.skillCheck3 = new FCheckBox();
         addChild(this.skillCheck3);
         this.skillCheck3.border = true;
         this.skillCheck3.textColor = StaticValue.BLUE;
         this.skillCheck3.x = 372;
         this.skillCheck3.y = 125;
         this.skillCheck3.text = LanResManager.getLanCommonTextWords("隔空渡气");
         this.skillCheck4 = new FCheckBox();
         addChild(this.skillCheck4);
         this.skillCheck4.border = true;
         this.skillCheck4.textColor = StaticValue.BLUE;
         this.skillCheck4.x = 462;
         this.skillCheck4.y = 125;
         this.skillCheck4.text = LanResManager.getLanCommonTextWords("普渡慈航");
         this.skillCheck5 = new FCheckBox();
         addChild(this.skillCheck5);
         this.skillCheck5.border = true;
         this.skillCheck5.textColor = StaticValue.BLUE;
         this.skillCheck5.x = 372;
         this.skillCheck5.y = 145;
         this.skillCheck5.text = LanResManager.getLanCommonTextWords("夫妻守护");
         this.skillCheck6 = new FCheckBox();
         addChild(this.skillCheck6);
         this.skillCheck6.border = true;
         this.skillCheck6.textColor = StaticValue.BLUE;
         this.skillCheck6.x = 462;
         this.skillCheck6.y = 145;
         this.skillCheck6.text = LanResManager.getLanCommonTextWords("破血狂杀");
         this.skillCheck7 = new FCheckBox();
         addChild(this.skillCheck7);
         this.skillCheck7.border = true;
         this.skillCheck7.textColor = StaticValue.BLUE;
         this.skillCheck7.x = 552;
         this.skillCheck7.y = 105;
         this.skillCheck7.text = LanResManager.getLanCommonTextWords("凝血离魂");
         this.optionCheck1 = new FCheckBox();
         addChild(this.optionCheck1);
         this.optionCheck1.border = true;
         this.optionCheck1.textColor = StaticValue.ORANGE;
         this.optionCheck1.text = LanResManager.getLanTextWords(this,"自动战斗结束后");
         this.optionCheck1.x = 372;
         this.optionCheck1.y = 205;
         this.optionCheck2 = new FCheckBox();
         addChild(this.optionCheck2);
         this.optionCheck2.border = true;
         this.optionCheck2.textColor = StaticValue.ORANGE;
         this.optionCheck2.text = LanResManager.getLanTextWords(this,"自动战斗时");
         this.optionCheck2.x = 372;
         this.optionCheck2.y = 225;
         this.optionCheck3 = new FCheckBox();
         addChild(this.optionCheck3);
         this.optionCheck3.border = true;
         this.optionCheck3.textColor = StaticValue.ORANGE;
         this.optionCheck3.text = LanResManager.getLanTextWords(this,"人物死亡后");
         this.optionCheck3.x = 372;
         this.optionCheck3.y = 245;
         this.optionCheck4 = new FCheckBox();
         addChild(this.optionCheck4);
         this.optionCheck4.border = true;
         this.optionCheck4.textColor = StaticValue.ORANGE;
         this.optionCheck4.text = LanResManager.getLanTextWords(this,"装备耐久为零时自动使用打磨石修理");
         this.optionCheck4.x = 372;
         this.optionCheck4.y = 265;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始挂机");
         addChild(this.startBtn);
         this.startBtn.x = panelWidth / 2 - this.startBtn.width - 20;
         this.startBtn.y = 300;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.stopBtn = new SecondButton();
         this.stopBtn.label = LanResManager.getLanCommonTextWords("停止挂机");
         addChild(this.stopBtn);
         this.stopBtn.x = panelWidth / 2 + 20;
         this.stopBtn.y = 300;
         this.stopBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function initMenu() : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         this.menuList1 = new FList();
         this.menuList2 = new FList();
         this.menuList3 = new FList();
         this.menuList4 = new FList();
         this.menuList5 = new FList();
         this.menuList6 = new FList();
         this.menuList7 = new FList();
         this.menuList8 = new FList();
         this.menuList1.itemRenderer = this.menuList2.itemRenderer = this.menuList3.itemRenderer = this.menuList4.itemRenderer = this.menuList5.itemRenderer = this.menuList6.itemRenderer = this.menuList7.itemRenderer = this.menuList8.itemRenderer = new AutoFightMenuListRender();
         this.menuContainer1 = new FCanvas();
         this.menuContainer1.visible = false;
         this.menuContainer1.skin = "backGroud";
         this.menuContainer1.width = 81;
         this.menuContainer1.height = 104;
         this.menuContainer1.x = 215;
         this.menuContainer1.y = 55;
         addChild(this.menuContainer1);
         this.menuList1.skin = "menuList_chat";
         this.menuList1.listWidth = 60;
         this.menuList1.x = this.menuList1.y = 2;
         this.menuContainer1.addChild(this.menuList1);
         this.menuList1.dataProvider = <list>
															<node show={LanResManager.getLanCommonTextWords("从小到大")} label="1"/>
															<node show={LanResManager.getLanCommonTextWords("从大到小")} label="2"/>
														</list>;
         this.menuList1.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scrollBar1 = new FVScorllBar(this.menuList1,100);
         this.scrollBar1.x = 62;
         this.scrollBar1.y = 2;
         this.menuContainer1.addChild(this.scrollBar1);
         this.menuContainer2 = new FCanvas();
         this.menuContainer2.visible = false;
         this.menuContainer2.skin = "backGroud";
         this.menuContainer2.width = 81;
         this.menuContainer2.height = 104;
         this.menuContainer2.x = 215;
         this.menuContainer2.y = 79;
         addChild(this.menuContainer2);
         this.menuList2.skin = "menuList_chat";
         this.menuList2.listWidth = 60;
         this.menuList2.x = this.menuList2.y = 2;
         this.menuContainer2.addChild(this.menuList2);
         this.menuList2.dataProvider = <list>
															<node show={LanResManager.getLanCommonTextWords("从小到大")} label="1"/>
															<node show={LanResManager.getLanCommonTextWords("从大到小")} label="2"/>
														</list>;
         this.menuList2.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scrollBar2 = new FVScorllBar(this.menuList2,100);
         this.scrollBar2.x = 62;
         this.scrollBar2.y = 2;
         this.menuContainer2.addChild(this.scrollBar2);
         this.menuContainer3 = new FCanvas();
         this.menuContainer3.visible = false;
         this.menuContainer3.skin = "backGroud";
         this.menuContainer3.width = 81;
         this.menuContainer3.height = 104;
         this.menuContainer3.x = 215;
         this.menuContainer3.y = 103;
         addChild(this.menuContainer3);
         this.menuList3.skin = "menuList_chat";
         this.menuList3.listWidth = 60;
         this.menuList3.x = this.menuList3.y = 2;
         this.menuContainer3.addChild(this.menuList3);
         this.menuList3.dataProvider = <list>
															<node show={LanResManager.getLanCommonTextWords("从小到大")} label="1"/>
															<node show={LanResManager.getLanCommonTextWords("从大到小")} label="2"/>
														</list>;
         this.menuList3.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scrollBar3 = new FVScorllBar(this.menuList3,100);
         this.scrollBar3.x = 62;
         this.scrollBar3.y = 2;
         this.menuContainer3.addChild(this.scrollBar3);
         this.menuContainer4 = new FCanvas();
         this.menuContainer4.visible = false;
         this.menuContainer4.skin = "backGroud";
         this.menuContainer4.width = 81;
         this.menuContainer4.height = 104;
         this.menuContainer4.x = 75;
         this.menuContainer4.y = 235;
         addChild(this.menuContainer4);
         this.menuList4.skin = "menuList_chat";
         this.menuList4.listWidth = 77;
         this.menuList4.x = this.menuList4.y = 2;
         this.menuContainer4.addChild(this.menuList4);
         this.menuList4.dataProvider = <list>
															<node show={LanResManager.getLanCommonTextWords("全门派")} label="0"/>
															<node show={LanResManager.getLanCommonTextWords("少林派")} label="1"/>
															<node show={LanResManager.getLanCommonTextWords("全真教")} label="2"/>
															<node show={LanResManager.getLanCommonTextWords("古墓派")} label="3"/>
															<node show={LanResManager.getLanCommonTextWords("桃花岛")} label="4"/>
														</list>;
         this.menuList4.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scrollBar4 = new FVScorllBar(this.menuList4,100);
         this.scrollBar4.x = 62;
         this.scrollBar4.y = 2;
         this.menuContainer4.addChild(this.scrollBar4);
         this.menuContainer5 = new FCanvas();
         this.menuContainer5.visible = false;
         this.menuContainer5.skin = "backGroud";
         this.menuContainer5.width = 81;
         this.menuContainer5.height = 104;
         this.menuContainer5.x = 158;
         this.menuContainer5.y = 235;
         addChild(this.menuContainer5);
         var _loc1_:XML = <list/>;
         _loc1_.appendChild(<node show={LanResManager.getLanCommonTextWords("全部等级")} label="0"/>);
         _loc2_ = 7;
         while(_loc2_ < 151)
         {
            _loc3_ = _loc2_ + LanResManager.getLanTextWords(this,"级以上");
            _loc1_.appendChild(<node show={_loc3_} label={_loc2_}/>);
            _loc2_++;
         }
         this.menuList5.skin = "menuList_chat";
         this.menuList5.listWidth = 60;
         this.menuList5.x = this.menuList5.y = 2;
         this.menuContainer5.addChild(this.menuList5);
         this.menuList5.dataProvider = _loc1_;
         this.menuList5.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scrollBar5 = new FVScorllBar(this.menuList5,100);
         this.scrollBar5.x = 62;
         this.scrollBar5.y = 2;
         this.menuContainer5.addChild(this.scrollBar5);
         this.menuContainer6 = new FCanvas();
         this.menuContainer6.visible = false;
         this.menuContainer6.skin = "backGroud";
         this.menuContainer6.width = 81;
         this.menuContainer6.height = 104;
         this.menuContainer6.x = 240;
         this.menuContainer6.y = 235;
         addChild(this.menuContainer6);
         this.menuList6.skin = "menuList_chat";
         this.menuList6.listWidth = 77;
         this.menuList6.x = this.menuList6.y = 2;
         this.menuContainer6.addChild(this.menuList6);
         this.menuList6.dataProvider = <list>
															<node show={LanResManager.getLanCommonTextWords("全部品质")} label="0"/>
															<node show={LanResManager.getLanCommonTextWords("白品以上")} label="1"/>
															<node show={LanResManager.getLanCommonTextWords("蓝品以上")} label="2"/>
															<node show={LanResManager.getLanCommonTextWords("绿品以上")} label="3"/>
															<node show={LanResManager.getLanCommonTextWords("紫品以上")} label="4"/>
														</list>;
         this.menuList6.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scrollBar6 = new FVScorllBar(this.menuList6,100);
         this.scrollBar6.x = 62;
         this.scrollBar6.y = 2;
         this.menuContainer6.addChild(this.scrollBar6);
         this.menuContainer7 = new FCanvas();
         this.menuContainer7.visible = false;
         this.menuContainer7.skin = "backGroud";
         this.menuContainer7.width = 81 + 20;
         this.menuContainer7.height = 104;
         this.menuContainer7.x = 454;
         this.menuContainer7.y = 55;
         addChild(this.menuContainer7);
         this.menuList7.skin = "menuList_chat";
         this.menuList7.listWidth = 60 + 20;
         this.menuList7.x = this.menuList7.y = 2;
         this.menuContainer7.addChild(this.menuList7);
         this.menuList7.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scrollBar7 = new FVScorllBar(this.menuList7,100);
         this.scrollBar7.x = 62 + 20;
         this.scrollBar7.y = 2;
         this.menuContainer7.addChild(this.scrollBar7);
         this.menuContainer8 = new FCanvas();
         this.menuContainer8.visible = false;
         this.menuContainer8.skin = "backGroud";
         this.menuContainer8.width = 81 + 20;
         this.menuContainer8.height = 104;
         this.menuContainer8.x = 454;
         this.menuContainer8.y = 79;
         addChild(this.menuContainer8);
         this.menuList8.skin = "menuList_chat";
         this.menuList8.listWidth = 60 + 20;
         this.menuList8.x = this.menuList8.y = 2;
         this.menuContainer8.addChild(this.menuList8);
         this.menuList8.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scrollBar8 = new FVScorllBar(this.menuList8,100);
         this.scrollBar8.x = 62 + 20;
         this.scrollBar8.y = 2;
         this.menuContainer8.addChild(this.scrollBar8);
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.menuList1:
               this.HPRecoverMode.text = this.menuList1.selectItem.show;
               this.menuContainer1.visible = false;
               break;
            case this.menuList2:
               this.MPRecoverMode.text = this.menuList2.selectItem.show;
               this.menuContainer2.visible = false;
               break;
            case this.menuList3:
               this.TLRecoverMode.text = this.menuList3.selectItem.show;
               this.menuContainer3.visible = false;
               break;
            case this.menuList4:
               this.pickMode_party.text = this.menuList4.selectItem.show;
               this.menuContainer4.visible = false;
               break;
            case this.menuList5:
               this.pickMode_level.text = this.menuList5.selectItem.show;
               this.menuContainer5.visible = false;
               break;
            case this.menuList6:
               this.pickMode_quality.text = this.menuList6.selectItem.show;
               this.menuContainer6.visible = false;
               break;
            case this.menuList7:
               this.attackMode_char.text = this.menuList7.selectItem.show;
               this.menuContainer7.visible = false;
               break;
            case this.menuList8:
               this.attackMode_ride.text = this.menuList8.selectItem.show;
               this.menuContainer8.visible = false;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.startBtn:
               dispatchEvent(new BaseEvent(UI_AUTOFIGHT_START,"",this.AFKVO));
               break;
            case this.stopBtn:
               dispatchEvent(new BaseEvent(UI_AUTOFIGHT_STOP));
         }
      }
      
      private function initText() : void
      {
         var fb:FLabel;
         var tf:TextFormat = new TextFormat();
         tf.align = "center";
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 44;
            y = 37;
            text = LanResManager.getLanTextWords(this,"当生命低于");
         }
         addChild(fb);
         this.HPvalue = new FTextInput();
         with(this.HPvalue)
         {
            x = 116;
            y = 38;
            textColor = StaticValue.WHITE;
            width = 31;
            height = 20;
            multiline = false;
            wordWrap = false;
            restrict = "0-9";
            defaultTextFormat = tf;
         }
         addChild(this.HPvalue);
         this.HPvalue.addEventListener(Event.CHANGE,this.onChange);
         this.HPRecoverMode = new FLabel();
         with(this.HPRecoverMode)
         {
            textColor = StaticValue.WHITE;
            x = 220;
            y = 38;
            text = LanResManager.getLanCommonTextWords("从大到小");
         }
         addChild(this.HPRecoverMode);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 44;
            y = 61;
            text = LanResManager.getLanTextWords(this,"当内力低于");
         }
         addChild(fb);
         this.MPvalue = new FTextInput();
         with(this.MPvalue)
         {
            x = 116;
            y = 62;
            textColor = StaticValue.WHITE;
            width = 31;
            height = 20;
            multiline = false;
            wordWrap = false;
            restrict = "0-9";
            defaultTextFormat = tf;
         }
         addChild(this.MPvalue);
         this.MPvalue.addEventListener(Event.CHANGE,this.onChange);
         this.MPRecoverMode = new FLabel();
         with(this.MPRecoverMode)
         {
            textColor = StaticValue.WHITE;
            x = 220;
            y = 62;
            text = LanResManager.getLanCommonTextWords("从大到小");
         }
         addChild(this.MPRecoverMode);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 44;
            y = 85;
            text = LanResManager.getLanTextWords(this,"当体力低于");
         }
         addChild(fb);
         this.TLvalue = new FTextInput();
         with(this.TLvalue)
         {
            x = 116;
            y = 86;
            textColor = StaticValue.WHITE;
            width = 31;
            height = 20;
            multiline = false;
            wordWrap = false;
            restrict = "0-9";
            defaultTextFormat = tf;
         }
         addChild(this.TLvalue);
         this.TLvalue.addEventListener(Event.CHANGE,this.onChange);
         this.TLRecoverMode = new FLabel();
         with(this.TLRecoverMode)
         {
            textColor = StaticValue.WHITE;
            x = 220;
            y = 86;
            text = LanResManager.getLanCommonTextWords("从大到小");
         }
         addChild(this.TLRecoverMode);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            x = 44;
            y = 112;
            text = LanResManager.getLanCommonTextWords("当人物双倍经验丹状态过期后,自动使用双倍经验丹");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            x = 44;
            y = 132;
            text = LanResManager.getLanCommonTextWords("当人物五倍经验丹状态过期后,自动使用五倍经验丹");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            x = 44;
            y = 152;
            text = LanResManager.getLanCommonTextWords("自动使用帝王黄气");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 44;
            y = 218;
            text = LanResManager.getLanCommonTextWords("拾取");
         }
         addChild(fb);
         this.pickMode_party = new FLabel();
         with(this.pickMode_party)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 79;
            y = 218;
            text = LanResManager.getLanCommonTextWords("全部门派");
         }
         addChild(this.pickMode_party);
         this.pickMode_level = new FLabel();
         with(this.pickMode_level)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 162;
            y = 218;
            text = LanResManager.getLanCommonTextWords("全部等级");
         }
         addChild(this.pickMode_level);
         this.pickMode_quality = new FLabel();
         with(this.pickMode_quality)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 244;
            y = 218;
            text = LanResManager.getLanCommonTextWords("全部品质");
         }
         addChild(this.pickMode_quality);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 320;
            y = 218;
            text = LanResManager.getLanCommonTextWords("装备");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            x = 44;
            y = 245;
            text = LanResManager.getLanCommonTextWords("拾取任务品");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            x = 44;
            y = 265;
            text = LanResManager.getLanCommonTextWords("拾取材料");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            x = 164;
            y = 245;
            text = LanResManager.getLanCommonTextWords("拾取药品");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            x = 164;
            y = 265;
            text = LanResManager.getLanCommonTextWords("拾取其他");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            x = 288;
            y = 245;
            text = LanResManager.getLanCommonTextWords("拾取铜币");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 372;
            y = 36;
            text = LanResManager.getLanTextWords(this,"人物自动使用1");
         }
         addChild(fb);
         this.attackMode_char = new FTextArea();
         this.attackMode_char.width = 76;
         this.attackMode_char.height = 20;
         with(this.attackMode_char)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 455;
            y = 36;
            text = LanResManager.getLanCommonTextWords("普通攻击");
         }
         addChild(this.attackMode_char);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 372;
            y = 60;
            text = LanResManager.getLanTextWords(this,"坐骑自动使用1");
         }
         addChild(fb);
         this.attackMode_ride = new FTextArea();
         this.attackMode_ride.width = 76;
         this.attackMode_ride.height = 20;
         with(this.attackMode_ride)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 455;
            y = 60;
            text = LanResManager.getLanCommonTextWords("普通攻击");
         }
         addChild(this.attackMode_ride);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 372;
            y = 163;
            text = LanResManager.getLanTextWords(this,"自动战斗范围");
         }
         addChild(fb);
         this.attatckArea = new FTextInput();
         with(this.attatckArea)
         {
            x = 488;
            y = 165;
            textColor = StaticValue.WHITE;
            width = 31;
            height = 20;
            multiline = false;
            wordWrap = false;
            restrict = "0-9";
            defaultTextFormat = tf;
         }
         addChild(this.attatckArea);
         this.attatckArea.addEventListener(Event.CHANGE,this.onChange);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            x = 372;
            y = 183;
            text = LanResManager.getLanTextWords(this,"自动战斗时间");
         }
         addChild(fb);
         this.attackTime = new FTextInput();
         with(this.attackTime)
         {
            x = 458;
            y = 185;
            textColor = StaticValue.WHITE;
            width = 31;
            height = 20;
            multiline = false;
            wordWrap = false;
            restrict = "0-9";
            defaultTextFormat = tf;
         }
         addChild(this.attackTime);
         this.attackTime.addEventListener(Event.CHANGE,this.onChange);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            x = 44;
            y = 305;
            text = LanResManager.getLanCommonTextWords("开始挂机打怪操作快捷键");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            x = 422;
            y = 305;
            text = LanResManager.getLanTextWords(this,"在地图任意空白处点击可中断挂机状态");
         }
         addChild(fb);
      }
      
      private function onSkillChange(param1:MouseEvent) : void
      {
         this.skillCheck1.selectState = this.skillCheck2.selectState = this.skillCheck3.selectState = this.skillCheck4.selectState = this.skillCheck5.selectState = this.skillCheck6.selectState = this.skillCheck7.selectState = this.skillCheck.selectState;
      }
      
      private function onChange(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.HPvalue:
               if(int(this.HPvalue.text) > 100)
               {
                  this.HPvalue.text = "100";
               }
               else
               {
                  this.HPvalue.text = int(this.HPvalue.text).toString();
               }
               break;
            case this.MPvalue:
               if(int(this.MPvalue.text) > 100)
               {
                  this.MPvalue.text = "100";
               }
               else
               {
                  this.MPvalue.text = int(this.MPvalue.text).toString();
               }
               break;
            case this.TLvalue:
               if(int(this.TLvalue.text) > 100)
               {
                  this.TLvalue.text = "100";
               }
               else
               {
                  this.TLvalue.text = int(this.TLvalue.text).toString();
               }
               break;
            case this.attatckArea:
               if(int(this.attatckArea.text) > 99)
               {
                  this.attatckArea.text = "99";
               }
               else
               {
                  this.attatckArea.text = int(this.attatckArea.text).toString();
               }
               break;
            case this.attackTime:
               if(int(this.attackTime.text) > 500)
               {
                  this.attackTime.text = "500";
               }
               else
               {
                  this.attackTime.text = int(this.attackTime.text).toString();
               }
         }
      }
      
      private function onShowMenu(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               this.menuContainer1.visible = !this.menuContainer1.visible;
               break;
            case this.btn2:
               this.menuContainer2.visible = !this.menuContainer2.visible;
               break;
            case this.btn3:
               this.menuContainer3.visible = !this.menuContainer3.visible;
               break;
            case this.btn4:
               this.menuContainer4.visible = !this.menuContainer4.visible;
               break;
            case this.btn5:
               this.menuContainer5.visible = !this.menuContainer5.visible;
               break;
            case this.btn6:
               this.menuContainer6.visible = !this.menuContainer6.visible;
               break;
            case this.btn7:
               this.menuContainer7.visible = !this.menuContainer7.visible;
               break;
            case this.btn8:
               this.menuContainer8.visible = !this.menuContainer8.visible;
         }
      }
      
      private function onHideMenu(param1:MouseEvent) : void
      {
         if(this.menuContainer1.visible)
         {
            this.menuContainer1.visible = false;
         }
         if(this.menuContainer2.visible)
         {
            this.menuContainer2.visible = false;
         }
         if(this.menuContainer3.visible)
         {
            this.menuContainer3.visible = false;
         }
         if(this.menuContainer4.visible)
         {
            this.menuContainer4.visible = false;
         }
         if(this.menuContainer5.visible)
         {
            this.menuContainer5.visible = false;
         }
         if(this.menuContainer6.visible)
         {
            this.menuContainer6.visible = false;
         }
         if(this.menuContainer7.visible)
         {
            this.menuContainer7.visible = false;
         }
         if(this.menuContainer8.visible)
         {
            this.menuContainer8.visible = false;
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function get AFKVO() : AfkInfo2
      {
         if(!this.VO)
         {
            this.VO = new AfkInfo2();
         }
         this.VO.isSupplyHP = this.HPcheck.selectState ? 1 : 0;
         this.VO.isSupplyMP = this.MPcheck.selectState ? 1 : 0;
         this.VO.isSupplySP = this.TLcheck.selectState ? 1 : 0;
         this.VO.hpCount = int(this.HPvalue.text);
         this.VO.mpCount = int(this.MPvalue.text);
         this.VO.spCount = int(this.TLvalue.text);
         this.VO.hpType = int(this.menuList1.selectItem.label);
         this.VO.mpType = int(this.menuList2.selectItem.label);
         this.VO.spType = int(this.menuList3.selectItem.label);
         this.VO.isAutoUseCharExp = this.charEXPcheck.selectState ? 1 : 0;
         this.VO.isAutoUseCharZhenqi = this.charZQcheck.selectState ? 1 : 0;
         this.VO.isAutoUseMountExp = this.rideEXPcheck.selectState ? 1 : 0;
         this.VO.isAutoPickUpEquip = this.pickCheck1.selectState ? 1 : 0;
         this.VO.isAutoPickUpTask = this.pickCheck2.selectState ? 1 : 0;
         this.VO.isAutoPickUpCaiLiao = this.pickCheck3.selectState ? 1 : 0;
         this.VO.isAutoPickUpDrug = this.pickCheck4.selectState ? 1 : 0;
         this.VO.isAutoPickUpOther = this.pickCheck5.selectState ? 1 : 0;
         this.VO.isAutoPickUpMoney = this.pickCheck6.selectState ? 1 : 0;
         this.VO.equipMenpai = int(this.menuList4.selectItem.label);
         this.VO.equipLevel = int(this.menuList5.selectItem.label);
         this.VO.equipPinZhi = int(this.menuList6.selectItem.label);
         this.VO.isAutoUseCharSkill = this.menuList7.selectItem.item;
         if(this.menuList8.selectItem)
         {
            this.VO.isAutoUseMountSkill = this.menuList8.selectItem.item;
         }
         this.VO.isAutoUseAllSKill = this.skillCheck.selectState ? 1 : 0;
         this.VO.isAutoUseWuShenLinTi = this.skillCheck1.selectState ? 1 : 0;
         this.VO.isAutoUseZhanYiJiAng = this.skillCheck2.selectState ? 1 : 0;
         this.VO.isAutoUseGeKongDuQi = this.skillCheck3.selectState ? 1 : 0;
         this.VO.isAutoUsePuDuCiHang = this.skillCheck4.selectState ? 1 : 0;
         this.VO.isAutoUseFuQiShouHu = this.skillCheck5.selectState ? 1 : 0;
         this.VO.isAutoUsePoXueKuangSha = this.skillCheck6.selectState ? 1 : 0;
         this.VO.isAutoUseNingXueLiHun = this.skillCheck7.selectState ? 1 : 0;
         this.VO.afkRangeCount = int(this.attatckArea.text);
         this.VO.afkTime = int(this.attackTime.text);
         this.VO.isAfkOverComeback = this.optionCheck1.selectState ? 1 : 0;
         this.VO.isHideBoss = this.optionCheck2.selectState ? 1 : 0;
         this.VO.isAutoUseFlower = this.optionCheck3.selectState ? 1 : 0;
         this.VO.isAutoUseDaMoShi = this.optionCheck4.selectState ? 1 : 0;
         return this.VO;
      }
      
      public function set AFKVO(param1:AfkInfo2) : void
      {
         this.VO = param1;
         this.HPcheck.selectState = param1.isSupplyHP == 1 ? true : false;
         this.MPcheck.selectState = param1.isSupplyMP == 1 ? true : false;
         this.TLcheck.selectState = param1.isSupplySP == 1 ? true : false;
         this.HPvalue.text = param1.hpCount.toString();
         this.MPvalue.text = param1.mpCount.toString();
         this.TLvalue.text = param1.spCount.toString();
         this.menuList1.setSelectItemByLabel(param1.hpType.toString());
         this.HPRecoverMode.text = this.menuList1.selectItem.show;
         this.menuList2.setSelectItemByLabel(param1.mpType.toString());
         this.MPRecoverMode.text = this.menuList2.selectItem.show;
         this.menuList3.setSelectItemByLabel(param1.spType.toString());
         this.TLRecoverMode.text = this.menuList3.selectItem.show;
         this.charEXPcheck.selectState = param1.isAutoUseCharExp == 1 ? true : false;
         this.charZQcheck.selectState = param1.isAutoUseCharZhenqi == 1 ? true : false;
         this.rideEXPcheck.selectState = param1.isAutoUseMountExp == 1 ? true : false;
         this.pickCheck1.selectState = param1.isAutoPickUpEquip == 1 ? true : false;
         this.pickCheck2.selectState = param1.isAutoPickUpTask == 1 ? true : false;
         this.pickCheck3.selectState = param1.isAutoPickUpCaiLiao == 1 ? true : false;
         this.pickCheck4.selectState = param1.isAutoPickUpDrug == 1 ? true : false;
         this.pickCheck5.selectState = param1.isAutoPickUpOther == 1 ? true : false;
         this.pickCheck6.selectState = param1.isAutoPickUpMoney == 1 ? true : false;
         this.menuList4.setSelectItemByLabel(param1.equipMenpai.toString());
         this.pickMode_party.text = this.menuList4.selectItem.show;
         this.menuList5.setSelectItemByLabel(param1.equipLevel.toString());
         this.pickMode_level.text = this.menuList5.selectItem.show;
         this.menuList6.setSelectItemByLabel(param1.equipPinZhi.toString());
         this.pickMode_quality.text = this.menuList6.selectItem.show;
         this.skills_char = param1.charSkillArr;
         this.skills_ride = param1.mountSkillArr;
         this.skillCheck.selectState = param1.isAutoUseAllSKill == 1 ? true : false;
         this.skillCheck1.selectState = param1.isAutoUseWuShenLinTi == 1 ? true : false;
         this.skillCheck2.selectState = param1.isAutoUseZhanYiJiAng == 1 ? true : false;
         this.skillCheck3.selectState = param1.isAutoUseGeKongDuQi == 1 ? true : false;
         this.skillCheck4.selectState = param1.isAutoUsePuDuCiHang == 1 ? true : false;
         this.skillCheck5.selectState = param1.isAutoUseFuQiShouHu == 1 ? true : false;
         this.skillCheck6.selectState = param1.isAutoUsePoXueKuangSha == 1 ? true : false;
         this.skillCheck7.selectState = param1.isAutoUseNingXueLiHun == 1 ? true : false;
         this.attatckArea.text = param1.afkRangeCount.toString();
         this.attackTime.text = param1.afkTime.toString();
         this.optionCheck1.selectState = param1.isAfkOverComeback == 1 ? true : false;
         this.optionCheck2.selectState = param1.isHideBoss == 1 ? true : false;
         this.optionCheck3.selectState = param1.isAutoUseFlower == 1 ? true : false;
         this.optionCheck4.selectState = param1.isAutoUseDaMoShi == 1 ? true : false;
      }
      
      public function set skills_char(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Skill = null;
         var _loc5_:Object = null;
         var _loc3_:int = int(param1.length);
         this.charSkills = [];
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_] as Skill;
            _loc5_ = {
               "item":_loc4_,
               "label":_loc4_.id,
               "show":_loc4_.res.name
            };
            this.charSkills.push(_loc5_);
            _loc2_++;
         }
         this.menuList7.dataProvider = this.charSkills;
         this.scrollBar7.update();
         this.menuList7.setSelectItemByLabel(this.VO.isAutoUseCharSkill.id.toString());
         this.attackMode_char.text = this.menuList7.selectItem.show;
      }
      
      public function set skills_ride(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Skill = null;
         var _loc5_:Object = null;
         if(Boolean(param1) && Boolean(param1.length) && Boolean(this.VO))
         {
            _loc3_ = int(param1.length);
            this.rideSkills = [];
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc4_ = param1[_loc2_] as Skill;
               _loc5_ = {
                  "item":_loc4_,
                  "label":_loc4_.id,
                  "show":_loc4_.res.name
               };
               this.rideSkills.push(_loc5_);
               _loc2_++;
            }
            this.menuList8.dataProvider = this.rideSkills;
            this.scrollBar8.update();
            if(this.VO.isAutoUseMountSkill)
            {
               this.menuList8.setSelectItemByLabel(this.VO.isAutoUseMountSkill.id.toString());
               if(this.menuList8.selectItem)
               {
                  this.attackMode_ride.text = this.menuList8.selectItem.show;
               }
            }
         }
         else
         {
            this.rideSkills = [];
            this.menuList8.dataProvider = <list/>;
            this.attackMode_ride.text = "";
         }
      }
   }
}

