package com.tgame.shell.view.components.ynSpecial
{
   import com.asQuery.$;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.systemculture.TipCanvas;
   import com.tgame.shell.view.components.utils.TipManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.display.RadioButton;
   import game.display.SimpleButton;
   import game.skin.GuiHun20260421Skin;
   import game.utils.SkinTools;
   
   public class YNGuiHun extends BasePanel
   {
      
      private static const LEVEL_ITEM_ID:int = 742025;
      
      private static const TUPO_ITEM_ID:int = 742026;
      
      private static const SLOT_BASE_INDEX:int = 1599;
      
      private static const SKILL_IDS:Array = [80200317,80200318,80200319,80200320];
      
      private static const SKILL_UNLOCK_HUAN:Array = [1,4,7,10];
      
      private static const SLOT_POS:Object = {
         "1600":[0,0],
         "1601":[0,59],
         "1602":[0,118],
         "1603":[333,0],
         "1604":[333,59],
         "1605":[333,118]
      };
      
      public var $parent:DisplayObject;
      
      private var ui:Object;
      
      private var slots:Sprite;
      
      private var container:Sprite;
      
      private var skillCon:Sprite;
      
      private var isPf:RadioButton;
      
      private var shuoming:SimpleButton;
      
      private var _isMain:Boolean;
      
      private var lNum:int;
      
      private var levelItem:ItemFace;
      
      private var pfItem:ItemFace;
      
      private var itemSkillSel:ItemFace;
      
      private var downPoint:Point;
      
      private var currItem:ItemFace;
      
      public function YNGuiHun()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(GuiHun20260421Skin.skin,"guihun");
         if(!this.ui)
         {
            this.cacheUIRefs();
         }
         this.container = new Sprite();
         addChild(this.container);
         this.initTips();
         this.initSlots();
         this.initEvents();
         this.initSkillItems();
         this.setHuanVisible(0);
      }
      
      override protected function createVariableReference() : void
      {
         this.isPf = getChildByName("duigou") as RadioButton;
         this.shuoming = getChildByName("shuoming") as SimpleButton;
         this.cacheUIRefs();
      }
      
      private function cacheUIRefs() : void
      {
         this.ui = {};
         this.ui.txtSkillState = $("jinengzhuangtai",this,true);
         this.ui.txtLevel = $("dengji",this,true);
         this.ui.txtBao = $("shuxingshuzihi1",this,true);
         this.ui.txtShan = $("shuxingshuzihi4",this,true);
         this.ui.txtWg = $("shuxingshuzihi2",this,true);
         this.ui.txtWf = $("shuxingshuzihi3",this,true);
         this.ui.btnShengJi = $("yanchenganniu",this,true);
         this.ui.btnTuPo = $("tupoanniu",this,true);
         this.ui.boxShengJiItem = $("shengjicailiaokuang",this,true);
         this.ui.boxTuPoItem = $("tupocailiangkuang",this,true);
         this.ui.checkPf = $("duigou",this,true);
         this.ui.txtHuTiCost = $("xiaohaowenben",this,true);
      }
      
      private function initTips() : void
      {
         var str:String = null;
         var tipCanvas:TipCanvas = null;
         str = "";
         tipCanvas = new TipCanvas(str,540);
         TipManager.regObj2HasTips(this.shuoming,null,false,function(param1:DisplayObject):TipCanvas
         {
            str = "<textformat leading = \'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "- Thu thập Hồn Nguyên Đơn để nâng cấp hồn hoàn, mỗi 10 cấp cần tiến hành đột  phá để " + "<br>" + "   mở khóa hiệu quả đặc biệt của tính năng" + "<br>" + "- Khi đột phá cần có Đột Phá Hồn Lực để thực hiện, khi đột phá sẽ có khả năng thất " + "<br>" + "   bại (giảm ngẫu nhiên 1 - 9  cấp) Hồn Hoàn. Có thể sử dụng thêm Linh Phách Hộ Thể để " + "<br>" + "   bảo vệ khi đột phá thất bại " + "<br>" + "- Tại các mốc 10, 40, 70, 100 mở khóa kỹ năng Hồn Vực Chi Uy hỗ trợ chiến đấu." + "<br>" + "- Tại các mốc 30, 60, 90, 100 sẽ mở khóa vị trí 4 vị trí Hồn Cốt. Người chơi có thể " + "<br>" + "   khảm các huân chương/ấn vào các vị trí này, sau khi khảm sẻ nhận hiệu quả kháng của " + "<br>" + "   trang bị đó. (Chỉ kháng kỹ năng, không kháng các hiệu quả kháng vốn có của huân chương)" + "<br>" + "- Cần có Hồn Cốt Tinh Phách mới có thể tháo các trang bị đã khảm vào các vị trí hồn cốt." + "<br>" + "- 2 vị trí khảm 5 và 6 cần sử dụng Hồn Cốt Khải Giới để mở khóa" + "<br>" + "- Một huân chương có thể cùng lúc trang bị và khảm vào Hồn Cốt. Khi khảm sẽ không " + "<br>" + "   nhận được thuộc tính của huân chương." + "<br>" + "</font>";
            str += "</textformat>";
            tipCanvas.htmlText = str;
            return tipCanvas;
         });
      }
      
      private function initSlots() : void
      {
         this.slots = new Sprite();
         this.slots.x = 17;
         this.slots.y = 79;
         this.slots.graphics.beginFill(16777215,0);
         this.slots.graphics.drawRect(0,0,368,153);
         this.slots.graphics.endFill();
         addChild(this.slots);
      }
      
      private function initEvents() : void
      {
         this.ui.btnShengJi.click(this.onClickShengJiHandler);
         this.ui.btnTuPo.click(this.onClickTupoHandler);
         this.slots.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.slots.addEventListener(MouseEvent.MOUSE_UP,this.showMenu,false,30);
      }
      
      private function initSkillItems() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Bitmap = null;
         var _loc5_:Skill = null;
         var _loc6_:ItemFace = null;
         this.skillCon = new Sprite();
         addChild(this.skillCon);
         this.skillCon.addEventListener(MouseEvent.CLICK,this.onClickSkillCon);
         var _loc1_:int = 0;
         while(_loc1_ < SKILL_IDS.length)
         {
            _loc2_ = _loc1_ == 3 ? 348 : int(15 + _loc1_ * 40);
            _loc3_ = 250;
            _loc4_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc4_.x = _loc2_;
            _loc4_.y = _loc3_;
            this.skillCon.addChild(_loc4_);
            _loc5_ = new Skill(SKILL_IDS[_loc1_]);
            _loc5_.isLearn = 1;
            _loc6_ = new ItemFace(_loc5_);
            _loc6_.name = "skillItem" + _loc1_;
            _loc6_.setShowCount(false);
            _loc6_.x = _loc2_ + 2;
            _loc6_.y = _loc3_ + 2;
            this.skillCon.addChild(_loc6_);
            _loc1_++;
         }
      }
      
      private function onClickSkillCon(param1:MouseEvent) : void
      {
         if(!(param1.target is ItemFace))
         {
            return;
         }
         var _loc2_:ItemFace = param1.target as ItemFace;
         if(!_loc2_.getBaseItem())
         {
            return;
         }
         if(_loc2_.filters.length > 0)
         {
            return;
         }
         var _loc3_:int = _loc2_.getBaseItem().id;
         var _loc4_:int = _loc2_.Select == true ? 0 : 1;
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.GUIHUN_SKILL_CLICK,"",[_loc3_,_loc4_]));
      }
      
      public function setData(param1:Object, param2:Boolean) : void
      {
         this.clearContainer();
         this._isMain = param2;
         this.lNum = param1.num;
         var _loc3_:int = Math.floor(param1.level / 10);
         var _loc4_:Boolean = param1.level >= 100;
         var _loc5_:Boolean = param1.level % 10 == 9;
         this.renderBaseInfo(param1,_loc3_);
         this.renderSkillState(_loc3_);
         this.renderAttrs(param1);
         this.renderOperateArea(param1,param2,_loc4_,_loc5_);
         this.set_GuiHun(param1.arr,param2);
         this.setSelectedSkill(param1.selectedSkillId);
      }
      
      private function renderBaseInfo(param1:Object, param2:int) : void
      {
         this.setText(this.ui.txtSkillState,"Hồn Vực Chi Uy cấp " + param1.skillLevel);
         this.setText(this.ui.txtLevel,"Tầng " + param1.level + " Cấp " + param2);
         this.setHuanVisible(param2);
      }
      
      private function renderSkillState(param1:int) : void
      {
         var _loc3_:ItemFace = null;
         var _loc2_:int = 0;
         while(_loc2_ < SKILL_UNLOCK_HUAN.length)
         {
            _loc3_ = this.skillCon.getChildByName("skillItem" + _loc2_) as ItemFace;
            if(_loc3_)
            {
               _loc3_.filters = param1 >= SKILL_UNLOCK_HUAN[_loc2_] ? [] : Tools.blackWhiteFilter;
            }
            _loc2_++;
         }
      }
      
      private function setSelectedSkill(param1:int) : void
      {
         var _loc3_:ItemFace = null;
         if(this.itemSkillSel)
         {
            this.itemSkillSel.Select = false;
            this.itemSkillSel = null;
         }
         if(!param1)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.skillCon.numChildren)
         {
            _loc3_ = this.skillCon.getChildAt(_loc2_) as ItemFace;
            if(!(!_loc3_ || !_loc3_.getBaseItem()))
            {
               if(_loc3_.getBaseItem().id == param1)
               {
                  _loc3_.Select = true;
                  this.itemSkillSel = _loc3_;
                  return;
               }
            }
            _loc2_++;
         }
      }
      
      private function renderAttrs(param1:Object) : void
      {
         this.setText(this.ui.txtBao,param1.bao + "");
         this.setText(this.ui.txtShan,param1.shan + "");
         this.setText(this.ui.txtWg,param1.wg + "");
         this.setText(this.ui.txtWf,param1.wf + "");
      }
      
      private function renderOperateArea(param1:Object, param2:Boolean, param3:Boolean, param4:Boolean) : void
      {
         if(!param2)
         {
            this.setOperateVisible(false,false);
            return;
         }
         this.setOperateVisible(!param3 && !param4,param4);
         this.levelItem = this.createGoodsItem(LEVEL_ITEM_ID,param1.num,184,238,!param3 && !param4);
         this.pfItem = this.createGoodsItem(TUPO_ITEM_ID,param1.numT,152,238,param4);
         this.setText(this.ui.txtHuTiCost,"Linh Phách Hộ Thể x" + this.getHuTiNum(param1.level));
         this.goodschange();
      }
      
      private function setOperateVisible(param1:Boolean, param2:Boolean) : void
      {
         this.setVisible(this.ui.btnShengJi,param1);
         this.setVisible(this.ui.boxShengJiItem,param1);
         this.setVisible(this.ui.btnTuPo,param2);
         this.setVisible(this.ui.boxTuPoItem,param2);
         this.setVisible(this.ui.checkPf,param2);
         this.setVisible(this.ui.txtHuTiCost,param2);
      }
      
      private function getHuTiNum(param1:int) : int
      {
         if(param1 <= 30)
         {
            return 1;
         }
         if(param1 <= 60)
         {
            return 2;
         }
         if(param1 <= 70)
         {
            return 3;
         }
         if(param1 <= 80)
         {
            return 4;
         }
         if(param1 <= 90)
         {
            return 5;
         }
         if(param1 <= 100)
         {
            return 10;
         }
         return 1;
      }
      
      public function goodschange() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.levelItem)
         {
            _loc1_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(LEVEL_ITEM_ID,true);
            this.levelItem.filters = _loc1_ >= this.lNum ? [] : Tools.blackWhiteFilter;
         }
         if(this.pfItem)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(TUPO_ITEM_ID,true);
            this.pfItem.filters = _loc2_ >= 1 ? [] : Tools.blackWhiteFilter;
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.currItem = param1.target as ItemFace;
         if(!this.currItem)
         {
            return;
         }
         this.downPoint = new Point(mouseX,mouseY);
         this.slots.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.clearDragState();
            return;
         }
         var _loc2_:Number = mouseX - this.downPoint.x;
         var _loc3_:Number = mouseY - this.downPoint.y;
         if(Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.GUIHUN_DRAG_STRAT,"",this.currItem));
            this.clearDragState();
         }
      }
      
      private function showMenu(param1:MouseEvent) : void
      {
         this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         if(param1.target as ItemFace)
         {
            return;
         }
         var _loc2_:int = this.getClickSlotIndex();
         if(!_loc2_)
         {
            return;
         }
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.GUIHUN_CLICK,"",[param1,_loc2_]));
      }
      
      private function getClickSlotIndex() : int
      {
         var _loc1_:int = -1;
         var _loc2_:int = -1;
         if(this.slots.mouseX >= 0 && this.slots.mouseX <= 35)
         {
            _loc1_ = 0;
         }
         else if(this.slots.mouseX >= 333 && this.slots.mouseX <= 368)
         {
            _loc1_ = 3;
         }
         if(this.slots.mouseY >= 0 && this.slots.mouseY <= 35)
         {
            _loc2_ = 1;
         }
         else if(this.slots.mouseY >= 59 && this.slots.mouseY <= 94)
         {
            _loc2_ = 2;
         }
         else if(this.slots.mouseY >= 118 && this.slots.mouseY <= 153)
         {
            _loc2_ = 3;
         }
         if(_loc1_ < 0 || _loc2_ < 0)
         {
            return 0;
         }
         return SLOT_BASE_INDEX + _loc1_ + _loc2_;
      }
      
      private function clearDragState() : void
      {
         this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.currItem = null;
         this.downPoint = null;
      }
      
      private function setHuanVisible(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            $("quan" + (_loc2_ + 1),this,true).attr("visible",param1 > 0 && _loc2_ + 1 <= param1);
            _loc2_++;
         }
      }
      
      private function onClickShengJiHandler(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.GUIHUN_SHENGJI));
      }
      
      private function onClickTupoHandler(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.GUIHUN_TUPO,"",this.isPf.selected));
      }
      
      private function clearContainer() : void
      {
         this.levelItem = null;
         this.pfItem = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
      }
      
      public function set_GuiHun(param1:Array, param2:Boolean = true) : void
      {
         var _loc4_:Goods = null;
         var _loc5_:Array = null;
         var _loc6_:ItemFace = null;
         while(this.slots.numChildren > 0)
         {
            this.slots.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            $("daojusuo" + (_loc3_ + 1),this,true).attr("visible",param1[_loc3_].isActve ? false : true);
            if(!(!param1[_loc3_].goodsID || !param1[_loc3_].index))
            {
               _loc4_ = new Goods(param1[_loc3_].goodsID,param1[_loc3_].index);
               _loc4_.roleID = GameInstance.mainChar.id;
               _loc5_ = SLOT_POS[_loc4_.position];
               if(_loc5_)
               {
                  _loc6_ = new ItemFace(_loc4_);
                  _loc6_.x = _loc5_[0];
                  _loc6_.y = _loc5_[1];
                  this.slots.addChild(_loc6_);
               }
            }
            _loc3_++;
         }
      }
      
      private function createGoodsItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean) : ItemFace
      {
         var _loc6_:Goods = new Goods(param1);
         _loc6_.count = param2;
         var _loc7_:ItemFace = new ItemFace(_loc6_);
         _loc7_.x = param3;
         _loc7_.y = param4;
         _loc7_.visible = param5;
         this.container.addChild(_loc7_);
         return _loc7_;
      }
      
      private function setText(param1:*, param2:String) : void
      {
         param1.attr("text",param2);
      }
      
      private function setVisible(param1:*, param2:Boolean) : void
      {
         param1.attr("visible",param2);
      }
   }
}

