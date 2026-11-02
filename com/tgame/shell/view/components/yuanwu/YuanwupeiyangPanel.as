package com.tgame.shell.view.components.yuanwu
{
   import com.asQuery.$;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.shell.view.components.systemculture.TipCanvas;
   import com.tgame.shell.view.components.utils.TipManager;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.Image;
   import game.display.Label;
   import game.display.List;
   import game.display.RadioButton;
   import game.display.SimpleButton;
   import game.skin.YuanWuSkin;
   import game.utils.SkinTools;
   
   public class YuanwupeiyangPanel extends BasePanel
   {
      
      public static const Chongsheng:String = "Chongsheng";
      
      public static const AutoBuy:String = "_yuanwuAutoBuy";
      
      public static const YUANWU_CHONGSHENGSUODING:String = "YUANWU_CHONGSHENGSUODING";
      
      public static const TAKEOUTALL:String = "TAKEOUTALL";
      
      public static const SET_EQUIP:String = "SET_EQUIP";
      
      public static const EAT_UP:String = "EAT_UP";
      
      public static const AUTO_SET:String = "AUTO_SET";
      
      public static const NULL_SKILLARR:String = "NULL_SKILLARR";
      
      private var xyBar:ColorBar;
      
      private var _functionId:int;
      
      public var closeFunc:Function;
      
      private var item:ItemFace;
      
      private var guanbi:SimpleButton;
      
      private var buyBtn:SimpleButton;
      
      public var checkBtn:RadioButton;
      
      private var chongshengBtn:SimpleButton;
      
      private var btnTakeOutAll:SimpleButton;
      
      private var btnSet:SimpleButton;
      
      private var btnEatUp:SimpleButton;
      
      private var btnAutoSet:SimpleButton;
      
      private var wenhao:SimpleButton;
      
      private var goodID:int;
      
      private var goodCount:int;
      
      private var id:int;
      
      public var changeid:int;
      
      private var chongshengList:List;
      
      private var xingxing1:Image;
      
      private var xingxing2:Image;
      
      private var xingxing3:Image;
      
      private var xingxing4:Image;
      
      private var xingxing5:Image;
      
      private var xingxing6:Image;
      
      private var xingxing7:Image;
      
      private var xingxing8:Image;
      
      private var xingxing9:Image;
      
      private var xingxing10:Image;
      
      private var xingxing11:Image;
      
      private var xingxing12:Image;
      
      private var xingxing13:Image;
      
      private var xingxing14:Image;
      
      private var xingxing15:Image;
      
      private var xingxing16:Image;
      
      private var xingxing17:Image;
      
      private var xingxing18:Image;
      
      private var xingxing19:Image;
      
      private var xingxing20:Image;
      
      private var dengji1:Image;
      
      private var dengji2:Image;
      
      private var dengji3:Image;
      
      private var dengji4:Image;
      
      private var dengji5:Image;
      
      private var dengji6:Image;
      
      private var dengji7:Image;
      
      private var dengji8:Image;
      
      private var dengji9:Image;
      
      private var dengji10:Image;
      
      private var dengji11:Image;
      
      private var dengji12:Image;
      
      private var dengji13:Image;
      
      private var dengji14:Image;
      
      private var dengji15:Image;
      
      private var dengji16:Image;
      
      private var dengji17:Image;
      
      private var dengji18:Image;
      
      private var dengji19:Image;
      
      private var dengji20:Image;
      
      private var shuxingzuo:Label;
      
      private var shuxingyou:Label;
      
      private var goodsName:Label;
      
      private var pinzhi:Label;
      
      private var xiaohaoCount:Label;
      
      private var chongshengMiaoshu:Label;
      
      private var goods:Goods;
      
      private var good:Goods;
      
      private var _container:Container = new Container();
      
      private var _container2:Container = new Container();
      
      private var data:Object;
      
      public function YuanwupeiyangPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YuanWuSkin.skin,"yuanwupeiyang");
         this.xyBar = new ColorBar(1,210);
         this.xyBar.x = 335;
         this.xyBar.y = 146;
         addChild(this.xyBar);
      }
      
      public function setInfo(param1:Object) : void
      {
         this.data = param1;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc2_:int = 1;
         while(_loc2_ < 21)
         {
            this["xingxing" + String(_loc2_)].visible = false;
            this["dengji" + String(_loc2_)].visible = false;
            _loc2_++;
         }
         this.shuxingzuo.text = "";
         this.shuxingyou.text = "";
         this.goodID = param1.goodsId;
         this.goodCount = param1.count;
         this.goods = new Goods(param1.id);
         this.goods.position = param1.post;
         this.goods.quality = param1.quality;
         this.goods.roleID = GameInstance.mainChar.id;
         var _loc3_:ItemFace = new ItemFace(this.goods);
         this._container.addChild(_loc3_);
         _loc3_.x = 134;
         _loc3_.y = 91;
         this.good = new Goods(this.goodID);
         this.good.count = this.goodCount;
         this.good.roleID = GameInstance.mainChar.id;
         this.item = new ItemFace(this.good);
         this.item.x = 329;
         this.item.y = 344;
         this._container.addChild(this.item);
         _loc2_ = 1;
         while(_loc2_ <= param1.lv)
         {
            this["xingxing" + String(_loc2_)].visible = true;
            if(_loc2_ == param1.lv)
            {
               this["dengji" + String(_loc2_)].visible = true;
            }
            _loc2_++;
         }
         this.goodsName.htmlText = "<font color=\'" + StaticValue.itemColors_html[this.goods.quality] + "\'>" + this.goods.res.name + "</font>";
         this.xyBar.setValue(param1.corMin,param1.corMax);
         var _loc4_:Array = ["攻击:","防御:","生命:","暴击:","闪避:","暴伤:","暴抗:","威压:"];
         _loc2_ = 0;
         while(_loc2_ < param1.arr.length)
         {
            if(_loc2_ < 4)
            {
               if(param1.lv < 20)
               {
                  this.shuxingzuo.text += _loc4_[_loc2_] + param1.arr[_loc2_] + "\n";
               }
               else
               {
                  this.shuxingzuo.text += _loc4_[_loc2_] + "----------" + "\n";
               }
            }
            else if(param1.lv < 20)
            {
               this.shuxingyou.text += _loc4_[_loc2_] + param1.arr[_loc2_] + "\n";
            }
            else
            {
               this.shuxingyou.text += _loc4_[_loc2_] + "----------" + "\n";
            }
            _loc2_++;
         }
         this.xiaohaoCount.text = "本次操作消耗" + this.goodCount + "颗" + this.good.res.name;
         ListElement.$parent = this;
         if(this.goods.res.position >= ItemPositionRange.POSTION_YUANWU.x && this.goods.res.position <= ItemPositionRange.POSTION_YUANWU.y)
         {
            $("biaoti",this,true).setVisible(true);
            $("biaoti2",this,true).setVisible(false);
         }
         else if(this.goods.res.position >= ItemPositionRange.POSTION_XIANHUN.x && this.goods.res.position <= ItemPositionRange.POSTION_XIANHUN.y)
         {
            $("biaoti",this,true).setVisible(false);
            $("biaoti2",this,true).setVisible(true);
         }
      }
      
      override protected function createVariableReference() : void
      {
         var i:int;
         var str1:String = null;
         var tipCanvas:TipCanvas = null;
         this.xingxing1 = getChildByName("xingxing1") as Image;
         this.xingxing2 = getChildByName("xingxing2") as Image;
         this.xingxing3 = getChildByName("xingxing3") as Image;
         this.xingxing4 = getChildByName("xingxing4") as Image;
         this.xingxing5 = getChildByName("xingxing5") as Image;
         this.xingxing6 = getChildByName("xingxing6") as Image;
         this.xingxing7 = getChildByName("xingxing7") as Image;
         this.xingxing8 = getChildByName("xingxing8") as Image;
         this.xingxing9 = getChildByName("xingxing9") as Image;
         this.xingxing10 = getChildByName("xingxing10") as Image;
         this.xingxing11 = getChildByName("xingxing11") as Image;
         this.xingxing12 = getChildByName("xingxing12") as Image;
         this.xingxing13 = getChildByName("xingxing13") as Image;
         this.xingxing14 = getChildByName("xingxing14") as Image;
         this.xingxing15 = getChildByName("xingxing15") as Image;
         this.xingxing16 = getChildByName("xingxing16") as Image;
         this.xingxing17 = getChildByName("xingxing17") as Image;
         this.xingxing18 = getChildByName("xingxing18") as Image;
         this.xingxing19 = getChildByName("xingxing19") as Image;
         this.xingxing20 = getChildByName("xingxing20") as Image;
         this.dengji1 = getChildByName("dengji1") as Image;
         this.dengji2 = getChildByName("dengji2") as Image;
         this.dengji3 = getChildByName("dengji3") as Image;
         this.dengji4 = getChildByName("dengji4") as Image;
         this.dengji5 = getChildByName("dengji5") as Image;
         this.dengji6 = getChildByName("dengji6") as Image;
         this.dengji7 = getChildByName("dengji7") as Image;
         this.dengji8 = getChildByName("dengji8") as Image;
         this.dengji9 = getChildByName("dengji9") as Image;
         this.dengji10 = getChildByName("dengji10") as Image;
         this.dengji11 = getChildByName("dengji11") as Image;
         this.dengji12 = getChildByName("dengji12") as Image;
         this.dengji13 = getChildByName("dengji13") as Image;
         this.dengji14 = getChildByName("dengji14") as Image;
         this.dengji15 = getChildByName("dengji15") as Image;
         this.dengji16 = getChildByName("dengji16") as Image;
         this.dengji17 = getChildByName("dengji17") as Image;
         this.dengji18 = getChildByName("dengji18") as Image;
         this.dengji19 = getChildByName("dengji19") as Image;
         this.dengji20 = getChildByName("dengji10m") as Image;
         this.chongshengMiaoshu = getChildByName("chongshengshuxing") as Label;
         this.shuxingzuo = getChildByName("shuxingzuo") as Label;
         this.shuxingyou = getChildByName("shuxingyou") as Label;
         this.goodsName = getChildByName("mingcheng") as Label;
         this.pinzhi = getChildByName("pinzhi") as Label;
         this.pinzhi.text = "";
         this.xiaohaoCount = getChildByName("xiaohao") as Label;
         i = 1;
         while(i < 21)
         {
            this["xingxing" + String(i)].visible = false;
            this["dengji" + String(i)].visible = false;
            i++;
         }
         this.checkBtn = getChildByName("duigou2") as RadioButton;
         this.checkBtn.addEventListener(MouseEvent.CLICK,this.btnClick);
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.onClose);
         this.buyBtn = getChildByName("gmanniu") as SimpleButton;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.btnClick);
         this.chongshengBtn = getChildByName("csanniu") as SimpleButton;
         this.chongshengBtn.addEventListener(MouseEvent.CLICK,this.btnClick);
         this.chongshengList = getChildByName("fujiaSX") as List;
         this.chongshengList.ItemClass = ListElement;
         this.chongshengList.verticalGap = -3;
         addChild(this._container);
         this.wenhao = getChildByName("wenhaotubiao3") as SimpleButton;
         this.btnTakeOutAll = getChildByName("qbanniu") as SimpleButton;
         this.btnTakeOutAll.addEventListener(MouseEvent.CLICK,this.btnClick);
         this.btnSet = getChildByName("franniu") as SimpleButton;
         this.btnSet.addEventListener(MouseEvent.CLICK,this.btnClick);
         this.btnEatUp = getChildByName("tunshianniu") as SimpleButton;
         this.btnEatUp.addEventListener(MouseEvent.CLICK,this.btnClick);
         this.btnAutoSet = getChildByName("zdanniu") as SimpleButton;
         this.btnAutoSet.addEventListener(MouseEvent.CLICK,this.btnClick);
         this._container2.x = 319;
         this._container2.y = 189;
         addChild(this._container2);
         this.chongshengMiaoshu.text = "1.重生后附加技能种类改变" + "\n" + "2.重生后附加技能层数改变";
         str1 = "1.装备重生时，玩家可选择锁定已有的附加技能。。" + "\n" + "2.点击复选框即可锁定该条目。" + "\n" + "3.不同品质的装备可锁定的数量也不同。" + "\n" + "  白色品质不可锁定" + "\n" + "  蓝色品质不可锁定" + "\n" + "  绿色品质可锁定1条" + "\n" + "  紫色品质可锁定2条" + "\n" + "  金色品质可锁定3条" + "\n" + "  红色品质可锁定4条" + "\n" + "4.锁定附加技能会消耗额外的5个涅槃石。" + "\n" + "5.可重生的附加技能包含人物角色所有的江湖绝学和门派绝学！";
         tipCanvas = new TipCanvas(str1,200);
         TipManager.regObj2HasTips(this.wenhao,null,false,function(param1:DisplayObject):TipCanvas
         {
            tipCanvas.htmlText = str1;
            return tipCanvas;
         });
      }
      
      private function btnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.buyBtn:
               if(!(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus()))
               {
                  PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[this.item.getBaseItem().id,0]);
               }
               break;
            case this.checkBtn:
               dispatchEvent(new BaseEvent(AutoBuy,"",this.checkBtn.selected));
               break;
            case this.chongshengBtn:
               if(!(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus()))
               {
                  dispatchEvent(new BaseEvent(YuanwupeiyangPanel.Chongsheng,"",this.goods));
               }
               break;
            case this.btnTakeOutAll:
               dispatchEvent(new BaseEvent(YuanwupeiyangPanel.TAKEOUTALL));
               break;
            case this.btnSet:
               if(this._container2.numChildren >= 5)
               {
                  NoticeManager.notify(NoticeManager.FOOT,"吞噬列表已满");
               }
               else
               {
                  dispatchEvent(new BaseEvent(YuanwupeiyangPanel.SET_EQUIP));
               }
               break;
            case this.btnEatUp:
               if(this._container2.numChildren <= 0)
               {
                  NoticeManager.notify(NoticeManager.FOOT,"请先选择可吞噬的装备");
               }
               else
               {
                  dispatchEvent(new BaseEvent(YuanwupeiyangPanel.EAT_UP));
               }
               break;
            case this.btnAutoSet:
               dispatchEvent(new BaseEvent(YuanwupeiyangPanel.AUTO_SET));
         }
      }
      
      public function addEquip(param1:Goods) : void
      {
         UITools.addChildAtPos(new ItemFace(param1),this._container2,this._container2.numChildren * 50);
      }
      
      public function addEquipArr(param1:Array) : void
      {
         var _loc3_:Goods = null;
         while(this._container2.numChildren > 0)
         {
            this._container2.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            UITools.addChildAtPos(new ItemFace(_loc3_),this._container2,this._container2.numChildren * 50);
            _loc2_++;
         }
      }
      
      public function set setSelected(param1:Boolean) : void
      {
         this.checkBtn.selected = param1;
      }
      
      public function updateData(param1:Array) : void
      {
         this.chongshengList.DataSource = param1;
      }
      
      private function onAdd(param1:Event) : void
      {
      }
      
      override public function onClose(param1:* = null) : void
      {
         this.clearAll();
         dispatchEvent(new BaseEvent(NULL_SKILLARR));
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         PipeManager.sendMsg(PipeConstants.LOCK_BACKPACK,false);
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function clearAll(param1:Boolean = false) : void
      {
         if(this._container2.numChildren > 0)
         {
            while(this._container2.numChildren)
            {
               this._container2.removeChildAt(0);
            }
         }
         else if(param1)
         {
            NoticeManager.notify(NoticeManager.FOOT,"没有选中的装备");
         }
      }
      
      public function refuseGood() : void
      {
         var _loc1_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.goodID,true);
         if(this.item)
         {
            if(_loc1_ < this.goodCount)
            {
               this.item.filters = Tools.blackWhiteFilter;
            }
            else
            {
               this.item.filters = [];
            }
         }
      }
      
      public function goodsNum(param1:int) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         var _loc2_:Goods = new Goods(this.data.goodsId);
         _loc2_.count = param1;
         this.item = new ItemFace(_loc2_);
         this.item.x = 329;
         this.item.y = 344;
         this._container.addChild(this.item);
         this.xiaohaoCount.text = "本次操作消耗" + this.goodCount + "颗" + this.good.res.name;
         this.refuseGood();
      }
   }
}

import com.tgame.common.vo.item.Skill;
import com.tgame.shell.view.components.yuanwu.YuanwupeiyangPanel;
import com.zcp.common.events.BaseEvent;
import flash.display.DisplayObject;
import flash.events.MouseEvent;
import game.display.Label;
import game.display.ListItemRender;
import game.display.RadioButton;

class ListElement extends ListItemRender
{
   
   public static var $parent:DisplayObject;
   
   private var _txt:Label;
   
   private var imgArr:Array;
   
   public var btn:RadioButton;
   
   private var obj:Object = {};
   
   public function ListElement()
   {
      super();
      this.buttonMode = true;
   }
   
   override protected function createVariableReference() : void
   {
      super.createVariableReference();
      this._txt = this.getChildByName("fujiajineng") as Label;
      this.btn = getChildByName("duigou3") as RadioButton;
      this.btn.addEventListener(MouseEvent.CLICK,this.clickHanlder);
   }
   
   override public function set data(param1:Object) : void
   {
      var _loc3_:Skill = null;
      var _loc2_:String = "";
      _data = param1;
      this.btn.visible = _data.visible;
      this.btn.selected = _data.suoding;
      switch(_data.skillType)
      {
         case 1:
            _loc3_ = new Skill(_data.skillId);
            _loc2_ = _loc3_.res.name;
            break;
         case 2:
            _loc2_ = "所有江湖绝学";
            break;
         case 3:
            _loc2_ = "所有门派技能";
      }
      this._txt.text = _loc2_ + "+" + _data.skillMin + "  (最大+" + _data.skillMax + ")";
   }
   
   private function clickHanlder(param1:MouseEvent) : void
   {
      this.obj.selected = this.btn.selected;
      this.obj.id = _data.type;
      $parent.dispatchEvent(new BaseEvent(YuanwupeiyangPanel.YUANWU_CHONGSHENGSUODING,"",this.obj));
   }
}
