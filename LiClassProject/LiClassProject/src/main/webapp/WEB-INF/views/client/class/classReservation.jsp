<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#sticky-nav{
	width:30%;
	height: 70%;
	z-index: 3;
}
</style>
<script>
var quick_menu = $('#sticky-nav');
var quick_top = 200;

quick_menu.css('top', $(window).height() );
$(document).ready(function(){
quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 200 ); 
$(window).scroll(function(){
quick_menu.stop();
quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 500 );
});
});
</script>
			
				<div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30">
                        <div class="class-booking-form">
                            <form>
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                        <h4 class="tour-form-title">Booking Info So Far</h4>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label required" for="booking_by">Booking By:</label>
                                            <input type="text" readonly class="form-control" name="booking_by" value="Manager: Dwaine">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label required" for="type">Type</label>
                                            <input type="text" readonly class="form-control" value="both" name="type">
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label required" for="address">Address:</label>
                                            <input type="text" readonly class="form-control" name="address" value="4901 Aztec Blvd # 49, Columbia, MO 65202">
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label required" for="distance">Distance in Miles:</label>
                                            <input type="text" readonly class="form-control" name="distance" value="11">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label required" for="drive_time">One-Way Drive Time in Mins:</label>
                                            <input type="text" readonly class="form-control" name="drive_time" value="18">
                                        </div>
                                    </div>
                                
                                
                                    
                                                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt30">
                                        <h4 class="tour-form-title">Pick-Up Details</h4>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label" for="pickup.disassembled">How many pieces need to be taken apart?</label>
                                            <select class="form-control" name="pickup.disassembled">
                                                <option value="0"selected>0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label" for="pickup.smalls">How many non-furniture smalls will we be picking up?</label>
                                            <select class="form-control" name="pickup.smalls">
                                                <option value="0" selected>0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="11">21</option>
                                                <option value="12">22</option>
                                                <option value="13">23</option>
                                                <option value="14">24</option>
                                                <option value="15">25</option>
                                                <option value="16">26</option>
                                                <option value="17">27</option>
                                                <option value="18">28</option>
                                                <option value="19">29</option>
                                                <option value="20">30</option>
                                                <option value="11">31</option>
                                                <option value="12">32</option>
                                                <option value="13">33</option>
                                                <option value="14">34</option>
                                                <option value="15">35</option>
                                                <option value="16">36</option>
                                                <option value="17">37</option>
                                                <option value="18">38</option>
                                                <option value="19">39</option>
                                                <option value="20">40</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <button type="submit" class="btn btn-primary">Calculate and Check Availability</button>
                                    </div>
                                </div>
                                </form>
                      			  </div>
							</div>
							</div>
