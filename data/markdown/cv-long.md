# Alexey Vekshin

**Unix, Network, DB Engineer | DevOps | Enterprise software developer**

<alexey@veksh.in> | +44 (7988) 703948  | <https://github.com/veksh>

# Summary

I am a Unix, DB and Network Engineer and Software Developer with over 25 years of experience in delivering IT services to buisnesses. I have a diverse IT background and have worked in a variety of roles, from ERP developer, Unix and VMWare engeneer, Network engeneer, Datacentre architect, and Oracle DBA to IT Infrastructure Team Leader for a medium-sized (7000+ employees) retail company.

My main areas of technical expertise are: Linux administration, datacentre virtualization, LANs and network services, enterprise mail and collaboration software, file sharing and Active Directory services, infrastructure automation, scripting and software development, system and application monitoring, relational databases, enterprise storage, high availability and business continuity, site reliability engineering, network monitoring and security.

My current interests include infrastructure automation (Ansible, Terraform), containerization and orchestration (Docker, k8s), cloud infrastructure (AWS, Y.Cloud), DevOps and GitOps (GitHub, GitLab), software development (Go, Ruby), and monitoring (Prometheus, Grafana). I'm always eager to learn new technologies and  languages, and to try things I've never done before.

# Skills
## Automation
- Ansible: using it for 5+ years, designed 20+ roles for managing Linux systems and apps, VMWare  ESXi hosts, Cisco and Juniper LAN switches, Samba Active Directory users/units/computers, Oracle v11-18 servers and many other apps and services (some roles are published on GitHub, 100+ stars)
- Source control and CI/CD: GitLab instance administration, policy development and user education, writing continuous integration pipelines for regression testing, application deployment with git
- Wholistic infrastructure management: using GitLab as network-wide Source of Truth and Ansible as IaC infrastructure for tasks like: pushing network configuration to LAN switches, configuring Linux-based DNS and DHCP servers, adding machine accounts to Active Directory, generating LAN configuration reports
## Cloud
- Services: familiar with the basic subset of AWS stack like IAM, EC2, VPCs, S3, CloudFront, DynamoDB
- Automation: managing AWS services from awscli, Ansible playbooks, Terraform modules, Python scripts, and with CloudFormation templates
- VM deployment: image building with Packer, post-install configuration with cloud-init and Ansible
- Monitoring: logging to CloudWatch and Grafana Cloud
- Serverless: basic familiarity with AWS Lambda stack
- Alternative clouds: some experience with Yandex Cloud, DigitalOcean and Fly.io

## Contaners and orchestrators
- Containers: building containers with Docker and Buildah, integrating with systemd services, publishing multi-architecture builds to custom repos, automated depolyment with GitHub actions
- Orchestration: using Docker Compose and Swarm for local development
- Kubernetes: deploying local clusters (minikube, k3s), stateful apps deployment set-up on local (k3s) and cloud (y.cloud, EKS) clusters

## Databases
- Oracle: DBA for some medium-scale (<1TB) 11g, 18c, XE and EE installations: installing and patching, DB creation and tuning, monitoring and SQL tuning, backups, publishing AWR reports for developers etc
- Automation: Ansible roles to install, patch and maintain Oracle servers (EE and XE)
- ETL: a pipeline for Progress to Oracle data transport, bidirectional integration with website CMS
- DB hot cloning: fan-out partial replication of staging DB with scripted storage snapshots
- Other DBs: some familiarity with Progress RDBMS, Postgres, SQLite, KV databases like Redis and DynamoDB

## Datacenter networking, hardware and storage
- Cisco Nexus switches: VPC and QoS configuration, security policies with VLANs and ACLs
- SAN hardware: configuring redundant fabrics on Brocade FibreChannel switches
- Enterprise storage: using HPE 3Par/Primera family of virtualized SAN storage arrays including advanced functionality like CoW snapshots for backup and DB cloning; some familiarity with Huawei and Hitachi storage arrays
- Server hardware: managing a fleet of HPE ProLiant and Dell RX servers, patching, deploying custom ESXi images, remote management with iLO and iDRAC
- Environment monitoring: with APC NetBotz, Unping and APC UPS temperature sensors

## Enterprise applications
- LAN infrastructure services: implemented DNS, DHCP, NTP, TFTP on Linux
- Mail: using Postfix as MTA, Communigate for IMAP, POP, ActiveSync, webmail, calendaring (2000+ users), FortiMail/IronPort AS/AV appliances as external relays, security protocols like SPF
- Active Directory on Samba: Ansible automated deployment of domain controllers and file servers, automated user and computer management, provisioning of user accounts
- Team collaboration: project management and time tracking with Trello, knowledge base with GitLab Wiki
- Others: helped to deploy, maintain and monitor many other apps, in-house (ERP, reporting, CRM), commercial (like Russian SAP-like accounting platform "1C") and open-source (Apache and Nginx web servers, Squid web proxy, lprng print server, djbdns content and cache, GPS-based NTP server etc)

## Golang development
- Developing plug-ins for Terraform and Prometheus, enterprise microservices and cloud-native lambdas
- Building REST and GRPC APIs, using Kafka as event bus
- ORM and DB interaction with GORM, sqlx, sqlc bun and postgres, sqlite and redis, db migrations with Goose and Atlas
- Web scraping with gocolly, cascadia and goquery
- Testing with GoMock, Mockery, gock and gofakeit
- Code linting with semgrep, golint, nilaway
- Release management with GitHub Actions, GoReleaser, ko
- Performance monitoring and profiling with Prometheus, Jaeger, OpenTelemetry
## Monitoring
- Prometheus TSDB and alerting: high-level scripting with Ansible, writing complex alerting rules, sending notifications to PagerDuty, OpsGenie and Telegram
- Linux monitoring: prometheus exporters, standalone tools like atop and NetData
- Grafana dashboards: designed 20+ company-wide dashboards for the host, network and apps
- Application monitoring: StatsD instrumentation and custom exporters for in-house apps
- Network monitoring: NetFlow collection for network monitoring and security audit
- SNMP monitoring: for switches, servers hardware, UPSes etc with snmp_exporter + custom Ansible roles
- Log monitoring: syslog + in-house solutions, Grafana Loki, some experience with Splunk and ELK stack
- Legacy monitoring systems: Nagios (and custom plugins for it), rrdtool, HPE GlancePlus

## Networking
- LAN technologies: RSTP, VLANs, VRRP etc, switch stacking and MLAG, VPC on Cisco Nexus
- WAN technologies: dynamic routing (mostly BGP), IPSec and GRE VPNs, WAN QoS
- Network design: for HQ, branch and data-center networks, with varying HA requirements from all-in-one SOHO router to highly available LAN with redundant core and access switches
- Policy development: authored company-wide network policies like IP allocation and host naming schemes, VLAN and BGP AS assignment, firewall and traffic segmentation rules, DMZ and VPN access policies
- Device management: Juniper (EX) and Cisco (Nexus and Catalyst) switches (on console and with Ansible), Mikrotik WAN routers/firewalls, Cisco ASA VPN/IPSec/firewall, some familiarity with Extreme Networks, ProCurve/H3C and Huawei switches
- WiFi networks: Cisco, Ruckus and Aruba controllers and APs, Mikrotik mesh networks, EAP-TLS with FreeRadius and certificate authentication

## Programming
- Languages: proficiency with Shell scripting (up to 1K LOC), Ruby (>10K LOC projects), perl (>5K LOC), and Go (> 5K LOC), some Python, C/C++ and Java knowledge
- Projects: implemented medium-scale integration projects like automatic provisioning of AD and mail user accounts from the HR database with privilege assignment, group management, and auto-disable
- Open source: C, Shell and Ansible code at <https://github.com/veksh>, contributions (mostly patches) to open source projects like mtail and nfdump, creation of custom forks if patches could not be pushed upstream
- Architecture: familiarity with design patterns, TDD, methodologies like DDD and Clean Architecture design, API design with REST and GRPC
- Past experience: worked with many other languages like Oracle PL/SQL, Pascal/Delphi and MATLAB, x86 Assembly

## Security
- Distributed authentication: using AD/Radius/LDAP auth for Linux and network devices
- Log monitoring/SIEM: with custom solutions (perl script + RE library)
- In-house CA: implemented with OpenSSL, scripted AnyConnect VPN certificate generation
- AV defense: mail and file server integration for DrWeb and Kaspersky anti-virus engines
- Defence in depth: Host IDS and hardening, network and Squid ACLs, WLAN EAP-TLS and per-user PSK, custom firewall rules generator, "deny by default" network policies
- AD Policies: some experience applying them in Samba AD environment

## Soft skills
- Team management: managing engineering team of 3-5 members, dividing and transferring responsibilities, planning sprints with Trello boards, mentoring
- Vendor interaction: experience raising issues and interacting with Cisco, HPE and Oracle support
- Business interaction: budgeting and defending projects, reporting directly to CEO, cost optimization with open-source (e.g. Samba) and free (e.g. Oracle XE) solutions, aligning IT strategy with company goals
- Keen interest in computing: from Arduino and home automation to ML and GPT3

## Unix/Linux
- 20+ years of experience: from HP-UX, Tru64 and Solaris to OpenBSD, MacOS, Linux (SuSE, RedHat/CentOS, Debian/Ubuntu, Alpine), and macOS
- Linux: installing, monitoring, and troubleshooting VMs and bare metal servers, complex network configuration, tuning memory and storage subsystems, performance monitoring and troubleshooting
- Deployment: creating system services and systemd units, making custom RPM packages, mirroring update repositories, building OVF images
- Scripting: Shell and Perl scripting, tools like sed/awk, parsing complex logs with Python, writing monitoring plugins and system maintenance scripts
- Automation: all aspects of Linux system configuration like networking setup, LVM storage, users and shell access, system updates and cleanup, VM cloning and resource configuration
- System tuning: configuring Linux for different scenarios like Oracle DB, 1000+ shell users, mail or print server

## Virtualisation
- VMware ESXi: management of stand-alone hypervisors with [Ansible](https://github.com/veksh/ansible-esxi)
- VM scripting: Automated VM deployment with shell and [ovftool](https://github.com/veksh/ovfconf)
- vCenter: enterprise datacenter deployment on shared FibreChannel storage with HA, vMotion, policies, alerts

## Windows
- Deployment and maintenance: working knowledge of Windows Server edition, storage subsystem configuration, network and firewall management, Active Directory and local accounts management
- Troubleshooting: familiarity with SysInternals suite and WinAPI
- Reversing and debugging: some experience with IDA and Hydra

# Professional experience

## 2022 to present: freelance, self-study
- Spent some time catching up with modern software development and deployment, cloud services and automation, containers
- Served as a private contractor in several small-scale projects, continued on-going support of services in previous place of work
- Developed some projects with newly-lerned tools, like Terraform module for GoDaddy DNS, AWS static site/Cloud Resume automation
## 1991 to 2022: Maxidom LLC, Saint-Petersburg (HQ), Russia (www.maxidom.ru)

- Lead a team of infrastructure engineers, supporting IT operations for 35 Maxidom and Castorama retail stores, 2 HQ offices, 4 datacenters (around 2000 users, 8000 LAN ports, 100 servers, 300TB of shared storage)
- Held multiple positions (support engineer, ERP programmer, Oracle DBA, Unix and network engineer), helped to evolve enterprise LAN and services to scale them x100 in size, from one small store LAN to distributed country-wide enterprise
- Networking: designed and implemented several generations of LANs
    - Designed common network blueprints for large retail store: 20000+ square meters, 500 LAN ports, 5-6 communication centers with stackable switches, optical interlinks, Wi-Fi for office and portable terminals, heavy video surveillance traffic, WAN routers for HQ connectivity
    - Was involved in all phases of network architecture design from planning and budgeting to configuration and maintenance
    - Designed enterprise WAN connectivity with dedicated redundant L3 VPNs between sites, BGP peering with multiple providers, QoS and ACLs, latency and loss monitoring
    - Implemented secure Wi-Fi infrastructure with Ruckus and Cisco controllers, EAP-TLS certificates + Radius auth, per-client PSK for office devices, SMS authentication for guests
    - Configured secure Internet access for office workstations and servers in NATed or proxied mode, created DMZs for servers with Mikrotik and Cisco ASA, set up remote VPN access with Cisco AnyConnect, provided restricted L2L VPN access for contractors
    - Automated most device management tasks with scripts and Ansible
- Server infrastructure for office and branches: supervising the fleet of 60+ servers
    - Designed corporate standard for centrally managed site infrastructure based on VMWare ESXi, Linux and open-source applications
    - Automated DNS/DHCP/AD and network management with Ansible + Gitlab
    - Developed a set of standards and blueprints for deployment and suport of common store and office services like file sharing, Squid filtering proxy, mail
    - Implemented monitoring for server hardware, UPS health status, environment temperature
    - Maintained vendor support contract, implemented pool of spare parts to save on support expenses, promptly resolved several hardware-related incidents
- Datacenter infrastructure: currently operating 4 DCs in Moscow and Saint-Petersburg
    - Implemented highly available virtualized VMWare vSphere cluster, hosting 100+ Linux and Windows VMs for diverse workloads from ERP and databases to file sharing and email servers
    - Planned and implemented DR infrastructure with VM mirroring, DB log shipping, cross-site backups
    - Provisioned FibreChannel shared storage on HPE Primera 650 and Brocade SilkWorm switches
    - Designed redundant network with Cisco Nexus VPC pair, 10/25G trunks to VMWare servers
- Applications: implemented multiple enterprise apps like GitLab server, CommuniGate email collaboration platform, Active Directory domain and file servers (on SerNet Samba)
- Oracle servers: designed corporate OLAP store based on Oracle EE, ETL processes to update it with ERP system data, hot-cloning DB for testing and reporting purposes
- In-house apps: helping developers to monitor logs and metrics for in-house applications, troubleshoot performance problems, size VMs and server hardware to accommodate for user base growth

## Recent achievements at my last position (2020-2022):
- Castorama merger: helped to connect 15 retail stores to existing infrastructure, scaling it x1.5 times
    - Was responsible for taking over the control of LAN and server infrastructure (from Kingfisher IT Services), providing a replacement for missed network infrastructure elements (like WLAN controllers)
    - Budgeted, purchased and configured server hardware to support network services, ERP integration, local store operations
    - Arranged and configured WAN links for stores to interconnect them into company network
    - Planned and successfully implemented migration procedure with minimal business disruption (overnight store migration) on a tight schedule (1 store every week), performed rolling update to re-use existing network equipment
    - Helped to migrate and localize ERP, HR and accounting apps
    - Implemented Active Directory and file sharing services in HQ and shops, migrated user accounts, set up automated synchronisation with HR database
    - Migrated mail accounts from Exchange and Office365 to on-premise Communigate server
- Datacenter refresh: designed and implemented new computing infrastructure for enterprise applications
    - Sized, budgeted and ordered servers, storage and networking hardware, engineering infrastructure (HWAC, UPS, racks) and network links for 2 new data centers (Saint Petersburg and Moscow)
    - Supervised equipment installation, configuration and wiring
    - Provisioned Fibre Channel storage, configured data and storage network, WAN links
    - Configured DC-wide network services like DNS and NTP, monitoring infrastructure, host installation and update repositories for VM deployment
    - Installed and configured VMware HA cluster on 8 compute nodes, implemented backup and management servers, designed backup and disaster recovery policy
    - Planned, documented and supervised migration of enterprise apps like ERP and e-mail from Kinfisher and Microsoft environments to the local in-house platforms
- Smaller projects
	- Enterprise Wi-Fi network with Ruckus: implemented enterprise-wide controller-based network with granuar permissions, inter-site roaming, EAP-TLS certificate authentication
	- Redundant inter-site links on Mikrotik hardware: replaced aging Cisco routers with cheaper Mikrotik alternatives, implemented redundant links over L3 VPNs and BGP peering to network operators
	- AD and CommuniGate integration with HR database: automated user account lifecycle management and rights assignment for AD and e-mail (groupware) accounts based on daily exports from HR database
	- Unified network and AD computer membership management: developed Ansible-based network and AD management framework, automating DNS, DHCP, AD and switch port configuration with Git repository as the central configuration source

# Education
Master of Science in Microelectronics, Saint-Petersburg State Technical University, 1991-1997

# Recently completed courses
- Advanced Microservices Developement in Go ([route256](https://route256.ozon.ru/))
- Cloud Service Engineer ([yandex practicum](https://practicum.yandex.ru/ycloud/))
- Machine Learning Introduction ([coursera](https://www.coursera.org/specializations/machine-learning-introduction))
- Splunk Enterprise Management
- Cisco UCS Administration

# Other information
Languages: English (good), Russian (native), Hebrew (beginner)
Citizenship: Russia, Israel
Residence permit: UK
