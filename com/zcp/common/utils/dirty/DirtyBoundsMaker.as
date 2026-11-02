package com.zcp.common.utils.dirty
{
   import com.zcp.common.linkedlist.LNode;
   import com.zcp.common.vo.Bounds;
   
   public class DirtyBoundsMaker
   {
      
      private var first:LNode;
      
      private var last:LNode;
      
      private var beginLN:LNode;
      
      public function DirtyBoundsMaker()
      {
         super();
      }
      
      public function clear() : void
      {
         this.first = null;
         this.last = null;
         this.beginLN = null;
      }
      
      public function addBounds(param1:Bounds, param2:Boolean = false) : void
      {
         var _loc4_:Bounds = null;
         var _loc5_:Bounds = null;
         var _loc6_:Bounds = null;
         var _loc3_:LNode = param2 ? this.first : this.beginLN || this.first;
         if(_loc3_ != null)
         {
            while(_loc3_ != null)
            {
               _loc4_ = _loc3_.data as Bounds;
               if(_loc4_.bottom <= param1.top)
               {
                  _loc3_ = _loc3_.next;
               }
               else
               {
                  if(_loc4_.top >= param1.bottom)
                  {
                     this.add(new LNode(param1),_loc3_.pre);
                     return;
                  }
                  if(_loc4_.intersects(param1))
                  {
                     _loc5_ = _loc4_.intersection(param1);
                     if(!_loc5_.equals(param1))
                     {
                        if(_loc5_.equals(_loc4_))
                        {
                           this.remove(_loc3_);
                           if(this.beginLN != null)
                           {
                              this.addBounds(param1);
                           }
                           else
                           {
                              this.add(new LNode(param1),this.last);
                           }
                        }
                        else
                        {
                           _loc6_ = _loc4_.union(param1);
                           this.remove(_loc3_);
                           this.beginLN = this.first;
                           if(this.beginLN != null)
                           {
                              this.addBounds(_loc6_);
                           }
                           else
                           {
                              this.add(new LNode(_loc6_),this.last);
                           }
                        }
                     }
                     return;
                  }
                  _loc3_ = _loc3_.next;
               }
            }
            if(_loc3_ == null)
            {
               this.add(new LNode(param1),this.last);
            }
         }
         else
         {
            this.add(new LNode(param1),null);
         }
      }
      
      private function cutTwoIntersectedBounds(param1:Bounds, param2:Bounds) : Array
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc3_:Array = [];
         var _loc4_:Array = [param1.top,param1.bottom,param2.top,param2.bottom].sort(Array.NUMERIC);
         var _loc5_:Array = [param1.left,param1.right,param2.left,param2.right].sort(Array.NUMERIC);
         var _loc12_:Bounds = param1.top <= param2.top ? param1 : param2;
         _loc6_ = _loc12_.left;
         _loc7_ = _loc12_.right;
         _loc8_ = Number(_loc5_[0]);
         _loc9_ = Number(_loc5_[3]);
         _loc12_ = param1.bottom >= param2.bottom ? param1 : param2;
         _loc10_ = _loc12_.left;
         _loc11_ = _loc12_.right;
         return [new Bounds(_loc6_,_loc7_,_loc4_[0],_loc4_[1]),new Bounds(_loc8_,_loc9_,_loc4_[1],_loc4_[2]),new Bounds(_loc10_,_loc11_,_loc4_[2],_loc4_[3])];
      }
      
      public function getBoundsArr() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:LNode = this.first;
         while(_loc2_ != null)
         {
            _loc1_.push(_loc2_.data);
            _loc2_ = _loc2_.next;
         }
         return _loc1_;
      }
      
      private function add(param1:LNode, param2:LNode = null) : void
      {
         if(param2 == null)
         {
            this.first = param1;
            this.first.pre = null;
            this.first.next = null;
            this.last = param1;
            this.last.pre = null;
            this.last.next = null;
         }
         else if(param2 == this.last)
         {
            this.last.next = param1;
            param1.pre = this.last;
            this.last = param1;
         }
         else
         {
            param1.pre = param2;
            param1.next = param2.next;
            param1.pre.next = param1;
            param1.next.pre = param1;
         }
      }
      
      private function remove(param1:LNode) : void
      {
         if(param1 == this.first)
         {
            if(param1 == this.last)
            {
               this.first = null;
               this.last = null;
            }
            else
            {
               this.first = param1.next;
               this.first.pre = null;
            }
         }
         else if(param1 == this.last)
         {
            this.last = this.last.pre;
            this.last.next = null;
         }
         else
         {
            param1.pre.next = param1.next;
            param1.next.pre = param1.pre;
         }
         this.beginLN = param1.next;
      }
   }
}

