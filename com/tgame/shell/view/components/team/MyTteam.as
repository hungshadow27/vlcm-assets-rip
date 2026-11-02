package com.tgame.shell.view.components.team
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class MyTteam extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var $parent:DisplayObject;
      
      private var orderPan:CombinationSelect;
      
      private var orderBtn:SecondButton;
      
      private var modifyBtn:SmallButton;
      
      private var creatTeamBtn:SecondButton;
      
      private var appointLeaderBtn:SecondButton;
      
      private var addMemberBtn:SecondButton;
      
      private var leaveTeamBtn:SecondButton;
      
      private var disemployBtn:SecondButton;
      
      private var lookInfoBtn:SecondButton;
      
      private var siLingZhenBtn:SecondButton;
      
      private var check1:FCheckBox;
      
      private var check2:FCheckBox;
      
      private var check3:FCheckBox;
      
      private var declare:FTextInput;
      
      private var memberContainer:Sprite;
      
      private var member:Member;
      
      private var orderName:FLabel;
      
      private var inputPanel:InputInviteName;
      
      private var state:int;
      
      public function MyTteam()
      {
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.team.myTeam.ui";
         this.init();
      }
      
      private function init() : void
      {
         var lb:FLabel;
         this.memberContainer = new Sprite();
         addChild(this.memberContainer);
         this.memberContainer.x = 4;
         this.memberContainer.y = 28;
         this.memberContainer.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.orderBtn = new SecondButton();
         this.orderBtn.label = LanResManager.getLanTextWords(this,"阵法");
         addChild(this.orderBtn);
         this.orderBtn.x = 475;
         this.orderBtn.y = 3;
         this.orderBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.modifyBtn = new SmallButton();
         this.modifyBtn.label = LanResManager.getLanTextWords(this,"修改宣言");
         addChild(this.modifyBtn);
         this.modifyBtn.x = 480;
         this.modifyBtn.y = 294;
         this.modifyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.creatTeamBtn = new SecondButton();
         this.creatTeamBtn.label = LanResManager.getLanTextWords(this,"自建队伍");
         addChild(this.creatTeamBtn);
         this.creatTeamBtn.x = (width - this.creatTeamBtn.width) / 2;
         this.creatTeamBtn.y = 332;
         this.creatTeamBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.appointLeaderBtn = new SecondButton();
         this.appointLeaderBtn.label = LanResManager.getLanTextWords(this,"任命队长");
         addChild(this.appointLeaderBtn);
         this.appointLeaderBtn.x = (width - this.appointLeaderBtn.width) / 2;
         this.appointLeaderBtn.y = 332;
         this.appointLeaderBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addMemberBtn = new SecondButton();
         this.addMemberBtn.label = LanResManager.getLanTextWords(this,"添加成员");
         addChild(this.addMemberBtn);
         this.addMemberBtn.x = this.appointLeaderBtn.x - this.addMemberBtn.width - 5;
         this.addMemberBtn.y = 332;
         this.addMemberBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.leaveTeamBtn = new SecondButton();
         this.leaveTeamBtn.label = LanResManager.getLanTextWords(this,"自我退队");
         addChild(this.leaveTeamBtn);
         this.leaveTeamBtn.x = this.addMemberBtn.x - this.leaveTeamBtn.width - 5;
         this.leaveTeamBtn.y = 332;
         this.leaveTeamBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.disemployBtn = new SecondButton();
         this.disemployBtn.label = LanResManager.getLanTextWords(this,"请离队伍");
         addChild(this.disemployBtn);
         this.disemployBtn.x = this.appointLeaderBtn.x + this.appointLeaderBtn.width + 5;
         this.disemployBtn.y = 332;
         this.disemployBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lookInfoBtn = new SecondButton();
         this.lookInfoBtn.label = LanResManager.getLanTextWords(this,"查看资料");
         addChild(this.lookInfoBtn);
         this.lookInfoBtn.x = this.disemployBtn.x + this.disemployBtn.width + 5;
         this.lookInfoBtn.y = 332;
         this.lookInfoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.siLingZhenBtn = new SecondButton();
         this.siLingZhenBtn.label = LanResManager.getLanCommonTextWords("四灵阵法");
         this.siLingZhenBtn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"等级达到70级以上时可以使用聚灵珠激活四灵阵法",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]) + "</textformat>";
         this.siLingZhenBtn.x = 430;
         this.siLingZhenBtn.y = 332;
         this.siLingZhenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check1 = new FCheckBox();
         this.check1.selectState = true;
         addChild(this.check1);
         this.check1.x = 280;
         this.check1.y = 224;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 280;
         this.check2.y = 246;
         this.check2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.x = 280;
         this.check3.y = 269;
         this.check3.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 6;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"同地图中每多组一个人");
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 300;
            y = 6;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"当前队伍阵法");
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 298;
            y = 225;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"当我没有组队时");
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 298;
            y = 247;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"当我是队长时");
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 298;
            y = 271;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"在主操作界面同时显示队员头像列表窗口");
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 14;
            y = 297;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"队伍宣言");
         addChild(lb);
         this.declare = new FTextInput();
         addChild(this.declare);
         this.declare.textColor = StaticValue.GREEN;
         this.declare.width = 378;
         this.declare.height = 20;
         this.declare.x = 86;
         this.declare.y = 297;
         this.declare.setMaxChars(18);
         this.declare.text = LanResManager.getLanTextWords(this,"一起去战斗");
         this.orderName = new FLabel();
         with(this.orderName)
         {
            x = 386;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.orderName.text = LanResManager.getLanTextWords(this,"阵法名字");
         addChild(this.orderName);
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.memberContainer.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            (this.memberContainer.getChildAt(_loc2_) as Member).hideFram();
            _loc2_++;
         }
         this.member = param1.target as Member;
         this.member.showFram();
         if(this.state == 1)
         {
            this.disemployBtn.enabled = true;
         }
         this.lookInfoBtn.enabled = true;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.orderBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_ORDERBTN_CLICK));
               break;
            case this.modifyBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_MODIFT_DECLARE,"",this.declare.text));
               break;
            case this.creatTeamBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_CREATETAMEBTN_CLICK));
               break;
            case this.appointLeaderBtn:
               if(this.member)
               {
                  this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_APPOINTLEADERBTN_CLICK,"",this.member.id));
               }
               break;
            case this.addMemberBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_CLICK));
               break;
            case this.leaveTeamBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_LEAVETEAMBTN_CLICK));
               break;
            case this.disemployBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_DISEMPLOYTEAMBTN_CLICK,"",this.member.id));
               break;
            case this.lookInfoBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_LOOKINFOBTN_CLICK,"",this.member.id));
               break;
            case this.siLingZhenBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_4LINGZHENG_CLICK));
         }
         switch(param1.currentTarget)
         {
            case this.check1:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_SHOW_PREREQUISITE_CHANGE,this.check1.selectState ? "yes" : "no",1));
               break;
            case this.check2:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_SHOW_PREREQUISITE_CHANGE,this.check2.selectState ? "yes" : "no",2));
               break;
            case this.check3:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_SHOW_PREREQUISITE_CHANGE,this.check3.selectState ? "yes" : "no",3));
         }
      }
      
      public function setBtnState(param1:int) : void
      {
         this.state = param1;
         switch(param1)
         {
            case 0:
               this.creatTeamBtn.visible = true;
               this.appointLeaderBtn.visible = false;
               this.addMemberBtn.visible = false;
               this.leaveTeamBtn.visible = false;
               this.disemployBtn.visible = false;
               this.lookInfoBtn.visible = false;
               this.modifyBtn.enabled = false;
               break;
            case 1:
               this.creatTeamBtn.visible = false;
               this.appointLeaderBtn.visible = true;
               this.appointLeaderBtn.enabled = true;
               this.addMemberBtn.visible = true;
               this.addMemberBtn.enabled = true;
               this.leaveTeamBtn.visible = true;
               this.leaveTeamBtn.enabled = true;
               this.disemployBtn.visible = true;
               this.disemployBtn.enabled = true;
               this.lookInfoBtn.visible = true;
               this.lookInfoBtn.enabled = true;
               this.modifyBtn.enabled = true;
               break;
            case 2:
               this.creatTeamBtn.visible = false;
               this.appointLeaderBtn.visible = true;
               this.appointLeaderBtn.enabled = false;
               this.addMemberBtn.visible = true;
               this.addMemberBtn.enabled = false;
               this.leaveTeamBtn.visible = true;
               this.leaveTeamBtn.enabled = true;
               this.disemployBtn.visible = true;
               this.disemployBtn.enabled = false;
               this.lookInfoBtn.visible = true;
               this.lookInfoBtn.enabled = true;
               this.modifyBtn.enabled = false;
         }
      }
      
      public function setMember(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:Member = null;
         while(this.memberContainer.numChildren > 0)
         {
            this.memberContainer.removeChildAt(0);
         }
         if(param1.length == 0)
         {
            return;
         }
         var _loc3_:int = 0;
         var _loc5_:int = int(param1.length);
         _loc2_ = 0;
         loop1:
         while(_loc2_ < 4)
         {
            _loc4_ = 0;
            while(_loc4_ < 2)
            {
               _loc6_ = new Member();
               _loc6_.charName.text = param1[_loc3_].charName;
               _loc6_.id = int(param1[_loc3_].id);
               _loc6_.head.bitmapData = StaticValue.getBitmapByClassName(param1[_loc3_].headRes + "_40").bitmapData;
               _loc6_.leader.text = param1[_loc3_].leader;
               _loc6_.level.text = LanResManager.getLanTextWords(this,"等级",[param1[_loc3_].level]);
               _loc6_._map.htmlText = "<font color=\'" + (param1[_loc3_].isSame ? StaticValue.WHITE_HTML : StaticValue.RED_HTML) + "\'>【" + param1[_loc3_].mapName + "】</font>  " + param1[_loc3_].xy;
               _loc6_._aloof.visible = !param1[_loc3_].isSame;
               if(_loc6_.id == GameInstance.mainChar.id)
               {
                  _loc6_._aloof.visible = false;
               }
               switch(param1[_loc3_].party)
               {
                  case LanResManager.getLanCommonTextWords("少林派"):
                     _loc6_.partyIco.bitmapData = StaticValue.getBitmapByClassName("ui.login.select.char.ico.shaolin").bitmapData;
                     break;
                  case LanResManager.getLanCommonTextWords("全真教"):
                     _loc6_.partyIco.bitmapData = StaticValue.getBitmapByClassName("ui.login.select.char.ico.quanzhen").bitmapData;
                     break;
                  case LanResManager.getLanCommonTextWords("古墓派"):
                     _loc6_.partyIco.bitmapData = StaticValue.getBitmapByClassName("ui.login.select.char.ico.gumu").bitmapData;
                     break;
                  case LanResManager.getLanCommonTextWords("桃花岛"):
                     _loc6_.partyIco.bitmapData = StaticValue.getBitmapByClassName("ui.login.select.char.ico.taohua").bitmapData;
                     break;
                  case LanResManager.getLanCommonTextWords("白驼山"):
                     _loc6_.partyIco.bitmapData = StaticValue.getBitmapByClassName("ui.login.select.char.ico.baituoshan").bitmapData;
                     break;
                  case LanResManager.getLanCommonTextWords("明教"):
                     _loc6_.partyIco.bitmapData = StaticValue.getBitmapByClassName("ui.login.select.char.ico.mingjiao").bitmapData;
               }
               this.memberContainer.addChild(_loc6_);
               _loc6_.x = _loc4_ * 276;
               _loc6_.y = _loc2_ * 65;
               if(++_loc3_ == _loc5_)
               {
                  break loop1;
               }
               _loc4_++;
            }
            _loc2_++;
         }
         this.member = null;
         this.disemployBtn.enabled = false;
         this.lookInfoBtn.enabled = false;
      }
      
      public function setDeclare(param1:String) : void
      {
         this.declare.text = param1;
      }
      
      public function setOrderName(param1:String) : void
      {
         this.orderName.text = param1;
      }
      
      public function showOrderPanel(param1:Array) : void
      {
         if(this.orderPan == null)
         {
            this.orderPan = new CombinationSelect();
            this.orderPan.$parent = this.$parent;
         }
         this.orderPan.studys = param1;
         GameInstance.uiInstance.uiContainer.addChild(this.orderPan);
         this.orderPan.visible = true;
         this.orderPan.x = (GameConfig.sceneWidth - this.orderPan.panelWidth) / 2;
         this.orderPan.y = (GameConfig.sceneHeight - this.orderPan.panelHeight) / 2;
      }
      
      public function setShowPrerequisite(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.check1.selectState = param1;
         this.check2.selectState = param2;
         this.check3.selectState = param3;
      }
      
      public function showInputNamePanel() : void
      {
         if(this.inputPanel == null)
         {
            this.inputPanel = new InputInviteName();
            this.inputPanel.$parent = this.$parent;
         }
         addChild(this.inputPanel);
         this.inputPanel.x = (width - this.inputPanel.width) / 2;
         this.inputPanel.y = (height - this.inputPanel.height) / 2;
      }
      
      public function hideInputNamePanel() : void
      {
         if(this.inputPanel == null || this.inputPanel.parent == null)
         {
            return;
         }
         this.inputPanel.parent.removeChild(this.inputPanel);
         this.inputPanel.input.text = LanResManager.getLanTextWords(this,"输入玩家名字");
      }
   }
}

import com.fireice.text.FLabel;
import com.fireice.text.FTextArea;
import com.fireice.text.FTextInput;
import com.tgame.common.res.lan.LanResManager;
import com.tgame.common.ui.componets.*;
import com.tgame.shell.view.components.TeamPanel;
import com.zcp.common.events.BaseEvent;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.*;

class InputInviteName extends Sprite
{
   
   public var $parent:DisplayObject;
   
   public var input:FTextInput;
   
   public var okBtn:SecondButton;
   
   public var cancelBtn:SecondButton;
   
   public function InputInviteName()
   {
      var lb:FLabel;
      super();
      addChild(StaticValue.getBitmapByClassName("ui.alert.bg"));
      lb = new FLabel();
      with(lb)
      {
         x = 9;
         y = 32;
         textColor = StaticValue.ORANGE;
         filters = StaticValue.filter;
      }
      lb.text = LanResManager.getLanTextWords(this,"请输入您要邀请玩家的名字");
      addChild(lb);
      this.input = new FTextInput();
      with(this.input)
      {
         x = 27;
         y = 62;
         background = true;
         backgroundColor = StaticValue.BLUE;
         width = 115;
         height = 20;
         textColor = StaticValue.WHITE;
      }
      this.input.setMaxChars(12);
      this.input.text = LanResManager.getLanTextWords(this,"输入玩家名字");
      addChild(this.input);
      this.okBtn = new SecondButton();
      this.okBtn.label = LanResManager.getLanTextWords(this,"邀请");
      addChild(this.okBtn);
      this.okBtn.x = 16;
      this.okBtn.y = 101;
      this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      this.cancelBtn = new SecondButton();
      this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
      addChild(this.cancelBtn);
      this.cancelBtn.x = 170 - 16 - this.cancelBtn.width;
      this.cancelBtn.y = 101;
      this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
   }
   
   private function onClick(param1:MouseEvent) : void
   {
      switch(param1.target)
      {
         case this.okBtn:
            this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_MEMBER,"",this.input.text));
            if(parent != null)
            {
               this.parent.removeChild(this);
            }
            break;
         case this.cancelBtn:
            if(parent != null)
            {
               this.parent.removeChild(this);
            }
            this.input.text = LanResManager.getLanTextWords(this,"输入玩家名字");
      }
   }
}

class Member extends Sprite
{
   
   public var id:int;
   
   public var head:Bitmap;
   
   public var charName:FLabel;
   
   public var leader:FLabel;
   
   public var level:FLabel;
   
   public var setup:FLabel;
   
   public var partyIco:Bitmap;
   
   public var _map:FTextArea;
   
   public var _aloof:Bitmap;
   
   public function Member()
   {
      super();
      graphics.beginFill(0,0);
      graphics.drawRect(0,0,272,61);
      graphics.endFill();
      mouseChildren = false;
      this.head = new Bitmap(new BitmapData(40,40,true,0));
      addChild(this.head);
      this.head.x = 16;
      this.head.y = 12;
      this.partyIco = new Bitmap(new BitmapData(35,35,true,0));
      this.partyIco.x = 219;
      this.partyIco.y = 5;
      addChild(this.partyIco);
      this._aloof = StaticValue.getBitmapByClassName("ui.team.text.aloof");
      addChild(this._aloof);
      this._aloof.x = 140;
      this._aloof.y = 13;
      this._aloof.visible = false;
      this.charName = new FLabel();
      with(this.charName)
      {
         x = 69;
         y = 5;
         textColor = StaticValue.BLUE;
         filters = StaticValue.filter;
      }
      addChild(this.charName);
      this.leader = new FLabel();
      with(this.leader)
      {
         x = 135;
         y = 22;
         textColor = StaticValue.GREEN;
         filters = StaticValue.filter;
      }
      addChild(this.leader);
      this.level = new FLabel();
      with(this.level)
      {
         x = 69;
         y = 22;
         textColor = StaticValue.WHITE;
         filters = StaticValue.filter;
      }
      addChild(this.level);
      this.setup = new FLabel();
      with(this.setup)
      {
         x = 138;
         y = 22;
         textColor = StaticValue.WHITE;
         filters = StaticValue.filter;
      }
      this._map = new FTextArea();
      with(this._map)
      {
         x = 69;
         y = 38;
         textColor = StaticValue.WHITE;
         autoSize = TextFieldAutoSize.LEFT;
         filters = StaticValue.filter;
      }
      addChild(this._map);
   }
   
   public function showFram() : void
   {
      graphics.clear();
      graphics.lineStyle(2,StaticValue.BLUE);
      graphics.beginFill(0,0);
      graphics.drawRect(0,0,272,62);
      graphics.endFill();
   }
   
   public function hideFram() : void
   {
      graphics.clear();
      graphics.beginFill(0,0);
      graphics.drawRect(0,0,272,62);
      graphics.endFill();
   }
}
