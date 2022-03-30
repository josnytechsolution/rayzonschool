<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ route('dashboard-a.index') }}" class="brand-link">
        <img src="{{ asset('dist/img/schoolbest-mini-logo.png') }}" alt="Logo" class="brand-image">
        <span class="brand-text font-weight-light">SCHOOLBEST</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Dashboard -->
                <li class="nav-item">
                    <a href="{{ route('dashboard-a.index') }}" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                            <i class="right fas fa-angle-right"></i>
                        </p>
                    </a>
                </li>


                <!-- Collect Fees -->
                <li class="nav-item">
                    <a href="#collectFees" class="nav-link" data-toggle="modal">
                        <i class="nav-icon fas fa-credit-card"></i>
                        <p>
                            Collect Fees
                            <i class="right fas fa-angle-right"></i>
                        </p>
                    </a>
                </li>

                <!-- Fees Collection -->
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fa fa-chart-bar"></i>
                        <p>
                            Fees Collection
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('fee-payment.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Collected Fees</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('mpesa-payments.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Mpesa Collection</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('coop-payments.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Coop Collection</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('balances') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Current Balances</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('arrears') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Fees Arrears</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('overpays') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Overpaid Fees</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('fee-discounts.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Fee Discounts</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- Fees Setup -->
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-wrench"></i>
                        <p>
                            Fees Setup
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @if(Auth::user()->profile === 'isSuper' || Auth::user()->profile === 'isAdmin')
                        <li class="nav-item">
                            <a href="{{ route('financial-years.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Financial Year</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('financial-sessions.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Financial Sessions</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('fee-parameters.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Fees Parameters</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('one-time-fees.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>One-Time Fees</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('optional-fees.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Optional Fees</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('class-fees.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Class Fees</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{ route('discount-levels.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Discount Levels</p>
                            </a>
                        </li>
                        @endif
                        <li class="nav-item">
                            <a href="#classFees" class="nav-link" data-toggle="modal">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Fees Structure</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#studFee" class="nav-link" data-toggle="modal">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Student Fees</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#classInvoices" class="nav-link" data-toggle="modal">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Generate Invoices</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- Student Details -->
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Student Details
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('parent-details.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Parents/Guardians</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('student-details.create') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>New Admission</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('student-details.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Students List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('Alumni') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Alumni List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('inactive') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Inactive Students</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('studentsStatistics') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Students Statistics</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- Transport -->
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-bus"></i>
                        <p>
                            School Transport
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('transport-zones.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Transport Zones</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('transport-zone-fees.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Transport Zone Fees</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('transport-fleets.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Transport Fleet</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            @php($current_sess = App\CurrentSession::Current()->first())
                            <a href="{{ route('student-transports.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p><small>@if($current_sess){{ strtoupper($current_sess->name) }}@endif</small> Transport</p>
                            </a>
                        </li>
                    </ul>
                </li>

                @if(Auth::user()->profile === 'isSuper' || Auth::user()->profile === 'isAdmin')
                <!-- School Setup -->
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-university"></i>
                        <p>
                            School Setup
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('class-grades.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Classes/Grades</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('class-streams.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Class Streams</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('classrooms.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Classrooms</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('academic-terms.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Academic Terms</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('class-managers.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Class Managers</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('academic-subjects.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Academic Subjects</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('class-subjects.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Class Subjects</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('subject-teachers.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Subject Teachers</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('student-promotion.create') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Students Promotion</p>
                            </a>
                        </li>
                    </ul>
                </li>
                @endif

                <!--
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-graduation-cap"></i>
                        <p>
                            Academics Details
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Co-curricular</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Examinations</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Student Results</p>
                            </a>
                        </li>
                    </ul>
                </li>
                -->

                <li class="nav-item">
                    <a href="{{ route('send-bulk-messages.index') }}" class="nav-link">
                        <i class="nav-icon fa fa-bullhorn"></i>
                        <p>
                            Communication
                            <i class="right fas fa-angle-right"></i>
                        </p>
                    </a>
                </li>

                @if(Auth::user()->profile === 'isSuper' || Auth::user()->profile === 'isAdmin')
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-coins"></i>
                        <p>
                            Expenditure
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('expense-departments.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Expense Department</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('expense-sections.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Expense Section</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('expenses.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>{{ date('Y') }} Expenses List</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-hands-helping"></i>
                        <p>
                            Staff Management
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('staff-departments.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Staff Departments</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('staff-sections.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Staff Sections</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('staff-members.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Staff Members</p>
                            </a>
                        </li>
                    </ul>
                </li>

                @if(Auth::user()->profile === 'isSuper')
                    <li class="nav-item">
                        <a href="{{ route('payroll-parameters.index') }}" class="nav-link">
                            <i class="nav-icon fa fa-sitemap"></i>
                            <p>
                                Staff Payroll
                                <i class="right fas fa-angle-right"></i>
                            </p>
                        </a>
                    </li>
                @endif


                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-cogs"></i>
                        <p>
                            Configurations
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('school-profile.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>School Profile</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('user-management.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Users Management</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('bank-accounts.index') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Banks Records</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-chart-pie"></i>
                        <p>
                            Report Center
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="#collectedReport" class="nav-link" data-toggle="modal">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Fees Collection</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#bankReports" class="nav-link" data-toggle="modal">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Bank Reports</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('feeSummary') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Fee Summary</p>
                            </a>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon far fa-circle"></i>
                                <p>
                                    Closing Balances
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item has-treeview">
                                    <a href="#" class="nav-link">
                                        <i class="fas fa-angle-right nav-icon"></i>
                                        <p>
                                            Termly Balances
                                            <i class="right fas fa-angle-left"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <li class="nav-item">
                                            <a href="#" class="nav-link">
                                                <i class="fas fa-angle-double-right nav-icon"></i>
                                                <p>Receivables</p>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#" class="nav-link">
                                                <i class="fas fa-angle-double-right nav-icon"></i>
                                                <p>Payables </p>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#" class="nav-link">
                                                <i class="fas fa-angle-double-right nav-icon"></i>
                                                <p>Summary</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('filterExpenses') }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Expenses Report</p>
                            </a>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon far fa-circle"></i>
                                <p>
                                    SMS Reports
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('studentsOutbox') }}" class="nav-link">
                                        <i class="fas fa-angle-right nav-icon"></i>
                                        <p>
                                            Student Outbox
                                        </p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ route('staffOutbox') }}" class="nav-link">
                                        <i class="fas fa-angle-right nav-icon"></i>
                                        <p>
                                            Staff Outbox
                                        </p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                @endif
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
<!-- End Main Sidebar Container -->